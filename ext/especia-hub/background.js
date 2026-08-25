// Especia Hub — ツールバーアイコンクリックでフルタブ表示
chrome.action.onClicked.addListener(() => {
  chrome.tabs.create({ url: chrome.runtime.getURL("index.html") });
});
