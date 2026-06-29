/// Non-web fallback: there is no page to reload, so always report that no
/// reload happened and let the caller show its error UI.
bool tryReloadOnceForStaleChunkImpl(String key) => false;

void reloadPageImpl() {}
