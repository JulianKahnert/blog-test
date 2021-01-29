//
//  PersonalWebsite.swift
//
//
//  Created by Julian Kahnert on 22.01.21.
//

import Publish
import SplashPublishPlugin

try PersonalWebsite().publish(using: [
    .installPlugin(.splash(withClassPrefix: "")),
    .copyResources(),
    .copyFiles(at: "root-resources"),
    .addMarkdownFiles(),
    .sortItems(by: \.date, order: .descending),
    .installPlugin(.ensureAllItemsAreTagged),
    .installPlugin(.ensureAllPostsHaveADate),
    .generateHTML(withTheme: .customFoundation),
    .generateRSSFeed(including: [.posts],
                     config: .default),
    .generateSiteMap(),
    .deploy(using: .gitHub("JulianKahnert/blog-test", branch: "main"))
])
