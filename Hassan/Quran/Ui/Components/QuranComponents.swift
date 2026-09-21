//
//  QuranComponents.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 18/09/2026.
//

import SwiftUI

struct SurahListItem: View {
    let surah: Surah
    
    var body: some View {
        PlainListItem(
            headlineContent: { Text(surah.transliteration) },
            leadingContent: { Text(surah.number.description) },
            trailingContent: { SurahNameImage(surahNumber: surah.number) },
            supportingContent: { Text(surah.translation) }
        )
    }
}

struct JuzListItem<LeadingContent: View>: View {
    let surahVerse: SurahVerse
    let leadingContent: () -> LeadingContent

    init(
        surahVerse: SurahVerse,
        @ViewBuilder leadingContent: @escaping () -> LeadingContent
    ) {
        self.surahVerse = surahVerse
        self.leadingContent = leadingContent
    }
    
    var body: some View {
        PlainListItem(
            headlineContent: {
                Text("\(stringResource(.juz)) \(surahVerse.verse.juzNumber)")
            },
            leadingContent: leadingContent,
            supportingContent: {
                Text(
                    "\(surahVerse.surah.transliteration) - "
                    + "\(stringResource(.verse)) "
                    + "\(surahVerse.verse.verseNumber)"
                )
            }
        )
    }
}

extension JuzListItem where LeadingContent == Text {
    init(surahVerse: SurahVerse) {
        self.init(
            surahVerse: surahVerse,
            leadingContent: { Text(surahVerse.verse.juzNumber.description) }
        )
    }
}

struct HizbListItem<LeadingContent: View>: View {
    let surahVerse: SurahVerse
    let leadingContent: () -> LeadingContent

    init(
        surahVerse: SurahVerse,
        @ViewBuilder leadingContent: @escaping () -> LeadingContent
    ) {
        self.surahVerse = surahVerse
        self.leadingContent = leadingContent
    }

    var body: some View {
        PlainListItem(
            headlineContent: { Text("\(stringResource(.hizb)) \(surahVerse.verse.hizbNumber)") },
            leadingContent: leadingContent,
            supportingContent: {
                Text(
                    "\(surahVerse.surah.transliteration) - "
                    + "\(stringResource(.verse)) "
                    + "\(surahVerse.verse.verseNumber)"
                )
            }
        )
    }
}

extension HizbListItem where LeadingContent == Text {
    init(surahVerse: SurahVerse) {
        self.init(
            surahVerse: surahVerse,
            leadingContent: { Text(surahVerse.verse.hizbNumber.description) }
        )
    }
}

struct SurahBookmarkCard: View {
    let surahVerse: SurahVerse
    let onClick: () -> Void
    
    var body: some View {
        Card(onClick: onClick) {
            PlainListItem(
                headlineContent: { Text(surahVerse.surah.transliteration) },
                trailingContent: { SurahNameImage(surahNumber: surahVerse.surah.number) },
                supportingContent: { Text("\(stringResource(.verse)) \(surahVerse.verse.verseNumber)") }
            )
        }
    }
}

struct JuzBookmarkCard: View {
    let surahVerse: SurahVerse
    let onClick: () -> Void
    
    var body: some View {
        Card(onClick: onClick) {
            JuzListItem(
                surahVerse: surahVerse,
                leadingContent: { EmptyView() }
            )
        }
    }
}

struct HizbBookmarkCard: View {
    let surahVerse: SurahVerse
    let onClick: () -> Void
    
    var body: some View {
        Card(onClick: onClick) {
            HizbListItem(
                surahVerse: surahVerse,
                leadingContent: { EmptyView() }
            )
        }
    }
}

#Preview {
    SurahListItem(
        surah: surahFixture
    )
}

#Preview {
    JuzListItem(
        surahVerse: surahVerseFixture
    )
}

#Preview {
    SurahBookmarkCard(
        surahVerse: surahVerseFixture,
        onClick: {}
    )
}

#Preview {
    JuzBookmarkCard(
        surahVerse: surahVerseFixture,
        onClick: {}
    )
}

