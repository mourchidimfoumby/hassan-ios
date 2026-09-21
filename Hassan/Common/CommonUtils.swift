//
//  CommonUtils.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

import Foundation

func stringResource(_ value: StringResource) -> String {
    NSLocalizedString(value.rawValue, comment: "")
}

func stringResource(_ value: StringResource, _ args: CVarArg...) -> String {
    String(
        format: NSLocalizedString(value.rawValue, comment: ""),
        arguments: args
    )
}

func dimensionResource(_ value: DimensResource) -> CGFloat {
    value.value
}

func toJson(_ object: Encodable?) -> String? {
    guard let object else {
        return nil
    }
    
    if let data = try? JSONEncoder().encode(object) {
        return String(data: data, encoding: .utf8)
    } else {
        return nil
    }
}

func fromJson<T: Decodable>(_ json: String?, type: T.Type = T.self) -> T? {
    if let data = json?.data(using: .utf8) {
        try? JSONDecoder().decode(T.self, from: data)
    } else {
        nil
    }
}
