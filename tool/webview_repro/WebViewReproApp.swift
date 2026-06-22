// WebView repro harness — reproduces the Threads/Telegram in-app WebView (WKWebView)
// that hangs the Flutter web app on its loading splash.
//
// WHY THIS AND NOT SAFARI: desktop/mobile Safari has service workers + full
// persistent storage and decodes brotli fine, so it does NOT reproduce the bug.
// A bare WKWebView (no service worker, partitioned storage) behaves like the
// Threads/Telegram in-app browser, so it DOES reproduce it.
//
// HOW TO USE
//   1. Xcode → File → New → Project → iOS → App (SwiftUI, Swift). Name it
//      "WebViewRepro". Set a deployment target of iOS 16.4+ (for isInspectable).
//   2. Replace the generated <Name>App.swift with the contents of this file
//      (keep the file's own name or rename to WebViewReproApp.swift).
//   3. Pick an iOS Simulator (e.g. iPhone 15) and Run (⌘R).
//   4. Watch the Xcode console: every JS console.log/error, window.onerror,
//      unhandledrejection, and the flutter-first-frame event are printed with a
//      [JS] prefix. If you see resource/WASM errors and NO "flutter-first-frame",
//      the engine never painted — that's the hang.
//   5. (Optional, richer) Mac Safari → Develop → Simulator → the page, for the
//      full Network/Console inspector (isInspectable is enabled below).
//
// TEST MATRIX
//   • Point URL at the LIVE site to reproduce the current bug:
//        https://kishchanka-art.by
//   • After deploying the fix (uncompressed wasm), reload — splash should clear
//     and you should see [JS] flutter-first-frame.
//   • To test a LOCAL build before deploying, run on your Mac:
//        cd build/web && python3 -m http.server 8000
//     then set URL to  http://<your-mac-LAN-ip>:8000  (NOT localhost — the
//     Simulator shares the Mac network, but use the LAN IP to be safe). Note a
//     plain python server does NOT apply .htaccess, so it serves wasm
//     uncompressed by default = the fixed behaviour.

import SwiftUI
import WebKit

// CHANGE THIS to whatever you want to test (live site, or local build server).
private let kTargetURL = "https://kishchanka-art.by"

struct ReproWebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let cfg = WKWebViewConfiguration()

        // Forward JS console + lifecycle events to the native (Xcode) console.
        let bridge = """
        (function () {
          function post(kind, msg) {
            try { window.webkit.messageHandlers.log.postMessage(kind + ': ' + msg); } catch (e) {}
          }
          ['log','warn','error','info'].forEach(function (level) {
            var orig = console[level];
            console[level] = function () {
              post(level, Array.prototype.slice.call(arguments).join(' '));
              return orig.apply(console, arguments);
            };
          });
          window.addEventListener('error', function (e) {
            post('window.onerror', (e.message || '') + ' @ ' + (e.filename || '') + ':' + (e.lineno || ''));
          });
          window.addEventListener('unhandledrejection', function (e) {
            post('unhandledrejection', String(e.reason));
          });
          window.addEventListener('flutter-first-frame', function () {
            post('event', 'flutter-first-frame FIRED — engine painted, splash should clear');
          }, { once: true });
          // Heartbeat so you can tell the page is alive but stuck.
          var n = 0;
          var t = setInterval(function () {
            n += 2;
            post('heartbeat', n + 's elapsed, still on splash');
            if (n >= 30) clearInterval(t);
          }, 2000);
          post('event', 'bridge installed, loading…');
        })();
        """
        let script = WKUserScript(source: bridge,
                                  injectionTime: .atDocumentStart,
                                  forMainFrameOnly: true)
        cfg.userContentController.add(context.coordinator, name: "log")
        cfg.userContentController.addUserScript(script)

        let webView = WKWebView(frame: .zero, configuration: cfg)
        if #available(iOS 16.4, *) { webView.isInspectable = true }
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: URL(string: kTargetURL)!))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKScriptMessageHandler, WKNavigationDelegate {
        func userContentController(_ uc: WKUserContentController,
                                   didReceive message: WKScriptMessage) {
            print("[JS] \(message.body)")
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("[NAV] didFinish: \(webView.url?.absoluteString ?? "?")")
        }
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("[NAV] didFail: \(error.localizedDescription)")
        }
        func webView(_ webView: WKWebView,
                     didFailProvisionalNavigation navigation: WKNavigation!,
                     withError error: Error) {
            print("[NAV] didFailProvisional: \(error.localizedDescription)")
        }
    }
}

@main
struct WebViewReproApp: App {
    var body: some Scene {
        WindowGroup {
            ReproWebView().ignoresSafeArea()
        }
    }
}
