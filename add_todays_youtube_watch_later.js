// ==UserScript==
// @name         add todays youtube watch later
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.youtube.com/
// @grant        none
// ==/UserScript==

(()=>{
    return 

    'use strict';

	// document.querySelectorAll("ytd-notification-topbar-button-renderer yt-icon-button")[0].click();

	const items = [...document.querySelectorAll("ytd-notification-renderer")];
	const elements = items.reduce((acc,element,i,arr)=>{
		const a = element.querySelectorAll("yt-formatted-string");
		const ele = a[2];
		const ele_text = ele.innerText;
		const has_day = /day/.test(ele_text)
		if( !has_day ){
			acc.push(element);
		}
		return acc;
	},[]);
	console.log(elements[0].querySelectorAll("a")[0].getAttribute("href"));
})()
