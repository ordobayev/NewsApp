//
//  NewsResult.swift
//  NewsApp
//
//  Created by Нургазы on 22/2/21.
//

import Foundation

struct NewsResult: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}




/*
 {
 "status": "ok",
 "totalResults": 2,
 -"articles": [
 -{
    -"source": {
        "id": null,
        "name": "Forbes"
 },
    "author": "Trefis Team, Contributor, \n Trefis Team, Contributor\n https://www.forbes.com/sites/greatspeculations/people/trefis/",
    "title": "Teradata Stock: Snowflake On A Budget?",
    "description": "We think that Snowflake, a provider of cloud data warehousing solutions, is significantly overvalued compared to Teradata, a company that provides database and analytics software. Snowflake has a market cap of about $82 billion, valued at about 75x forward re…",
    "url": "https://www.forbes.com/sites/greatspeculations/2021/02/22/teradata-stock-snowflake-on-a-budget/",
    "urlToImage": "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F60336c9586e6d76f62783d18%2F0x0.jpg",
    "publishedAt": "2021-02-22T16:00:00Z",
    "content": "KIEV, UKRAINE - 2018/12/04: In this photo illustration, the Teradata Corporation logo seen ... [+] displayed on a smartphone. (Photo Illustration by Igor Golovniov/SOPA Images/LightRocket via Getty I… [+19780 chars]"
 },
 -{
    -"source": {
        "id": null,
        "name": "Forbes"
    },
    "author": "Q.ai - Investing Reimagined, Contributor, \n Q.ai - Investing Reimagined, Contributor\n https://www.forbes.com/sites/qai/",
    "title": "Top Stocks To Buy Today Amid Spooks From Rising Bond Yields",
    "description": "After stocks cooled off for much of last week, rising bond yields are keeping investors on their toes. But Q.ai's Artificial Intelligence has taken the guesswork out of it all to bring you today's top buys.",
    "url": "https://www.forbes.com/sites/qai/2021/02/22/top-stocks-to-buy-today-amid-spooks-from-rising-bond-yields/",
    "urlToImage": "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F6033d2884bb7fcebd13f5233%2F0x0.jpg",
    "publishedAt": "2021-02-22T15:53:43Z",
    "content": "getty\r\nAfter stocks mildly cooled off for much of last week, rising bond yields continued to spook investors especially tech investors. With the 10-year yield hitting its highest rate in over a year,… [+6116 chars]"
 } ]
 
}
 */
