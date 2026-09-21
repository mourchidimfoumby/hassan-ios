//
//  ReciterMapper.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//

extension LocalReciter {
    func toReciter() -> Reciter {
        Reciter(
            id: reciterId,
            name: name,
            imageUrl: imageUrl(id: reciterId, imageName: imageName)
        )
    }
}

extension Reciter {
    func toLocal() -> LocalReciter {
        LocalReciter(
            reciterId: id,
            name: name,
            imageName: imageUrl.components(separatedBy: "/").last ?? ""
        )
    }
}

private func imageUrl(id: String, imageName: String) -> String {
    "\(BundleInfo.oracleBucketUrl)/reciters/\(id)/\(imageName)"
}
