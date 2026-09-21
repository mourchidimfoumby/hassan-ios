//
//  BundleInfo.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

import Foundation

struct BundleInfo {
    static let oracleBucketUrl: String = (Bundle.main.infoDictionary?["ORACLE_BUCKET_URL"] as? String) ?? ""
}
