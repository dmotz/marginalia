/**
 * Welcome to your Workbox-powered service worker!
 *
 * You'll need to register this file in your web app and you should
 * disable HTTP caching for this file too.
 * See https://goo.gl/nhQhGp
 *
 * The rest of the code is auto-generated. Please don't update this file
 * directly; instead, make changes to your Workbox build configuration
 * and re-run your build process.
 * See https://goo.gl/2aRDsh
 */

importScripts("https://storage.googleapis.com/workbox-cdn/releases/4.1.1/workbox-sw.js");

importScripts(
  "./precache-manifest.7f8e0ba1a0566bb14bb2f8c310b0efbf.js"
);

workbox.core.skipWaiting();

workbox.core.clientsClaim();

/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [
  {
    "url": "about.svg",
    "revision": "d4b63adf1f6e629c53c49e835510ad8b"
  },
  {
    "url": "favicon.png",
    "revision": "816c92bf9c26dd87ed21b8ec8ea2ad68"
  },
  {
    "url": "focus.svg",
    "revision": "e0ebed3aa665504195c9bf213233634b"
  },
  {
    "url": "logo.svg",
    "revision": "faf24cec671a4c15b1fa429e01e1b6dc"
  },
  {
    "url": "random.svg",
    "revision": "4cf4c303a93072e15ba6b828b1646b7c"
  }
].concat(self.__precacheManifest || []);
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});

workbox.routing.registerRoute(/^https:\/\/fonts\.googleapis\.com/, new workbox.strategies.StaleWhileRevalidate(), 'GET');
workbox.routing.registerRoute(/^https:\/\/fonts\.gstatic\.com/, new workbox.strategies.CacheFirst(), 'GET');
