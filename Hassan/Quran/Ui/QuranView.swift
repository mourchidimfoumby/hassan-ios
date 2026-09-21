//
//  QuranView.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import SwiftUI

struct QuranDestination: View {
    let onSurahClick: (SurahNumber) -> Void
    let onJuzClick: (JuzNumber, SurahNumber) -> Void
    let onHizbClick: (HizbNumber, SurahNumber) -> Void
    let onSurahBookmarkClick: (SurahNumber, VerseNumber?) -> Void
    let onJuzBookmarkClick: (JuzNumber, SurahNumber, VerseNumber?) -> Void
    let onHizbBookmarkClick: (HizbNumber, SurahNumber, VerseNumber?) -> Void
    let onSearchClick: () -> Void
    
    @StateObject private var viewModel = QuranMainThreadInjector.shared.resolve(QuranViewModel.self)

    var body: some View {
        if (!viewModel.uiState.isLoading) {
            QuranView(
                surahs: viewModel.uiState.surahs,
                allJuz: viewModel.uiState.allJuz,
                allHizb: viewModel.uiState.allHizb,
                surahVersePreferences: viewModel.uiState.preferences!,
                quranContentType: viewModel.uiState.contentType,
                onQuranContentTypeChange: viewModel.onQuranContentTypeChange,
                onSurahClick: onSurahClick,
                onJuzClick: onJuzClick,
                onHizbClick: onHizbClick,
                onSurahBookmarkClick: onSurahBookmarkClick,
                onJuzBookmarkClick: onJuzBookmarkClick,
                onHizbBookmarkClick: onHizbBookmarkClick,
                onSearchClick: onSearchClick
            )
        }
    }
}

private struct QuranView: View {
    let surahs: [Surah]
    let allJuz: [Juz]
    let allHizb: [Hizb]
    let surahVersePreferences: SurahVersePreferences
    let quranContentType: QuranViewModel.QuranContentType
    let onQuranContentTypeChange: (QuranViewModel.QuranContentType) -> Void
    let onSurahClick: (SurahNumber) -> Void
    let onJuzClick: (JuzNumber, SurahNumber) -> Void
    let onHizbClick: (HizbNumber, SurahNumber) -> Void
    let onSurahBookmarkClick: (SurahNumber, VerseNumber?) -> Void
    let onJuzBookmarkClick: (JuzNumber, SurahNumber, VerseNumber?) -> Void
    let onHizbBookmarkClick: (HizbNumber, SurahNumber, VerseNumber?) -> Void
    let onSearchClick: () -> Void
    
    var body: some View {
        QuranContent(
            surahs: surahs,
            allJuz: allJuz,
            allHizb: allHizb,
            surahVersePreferences: surahVersePreferences,
            quranContentType: quranContentType,
            onSurahClick: onSurahClick,
            onJuzClick: onJuzClick,
            onHizbClick: onHizbClick,
            onSurahBookmarkClick: onSurahBookmarkClick,
            onJuzBookmarkClick: onJuzBookmarkClick,
            onHizbBookmarkClick: onHizbBookmarkClick
        )
        .navigationTitle(stringResource(.quran))
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(
                    action: onSearchClick,
                    label: { Image(systemName: SystemImageResource.search) }
                )
                
                Menu(
                    content: {
                        Picker(
                            selection: Binding(
                                get: { quranContentType },
                                set: onQuranContentTypeChange
                            ),
                            content: {
                                Text(stringResource(.surah)).tag(QuranViewModel.QuranContentType.surah)
                                Text(stringResource(.juz)).tag(QuranViewModel.QuranContentType.juz)
                                Text(stringResource(.hizb)).tag(QuranViewModel.QuranContentType.hizb)
                            },
                            label: {
                                Text(stringResource(.filterQuranView))
                            }
                        )
                    },
                    label: {
                        Image(systemName: SystemImageResource.filter)
                    }
                )
            }
        }
    }
}

private struct QuranContent: View {
    let surahs: [Surah]
    let allJuz: [Juz]
    let allHizb: [Hizb]
    let surahVersePreferences: SurahVersePreferences
    let quranContentType: QuranViewModel.QuranContentType
    let onSurahClick: (SurahNumber) -> Void
    let onJuzClick: (JuzNumber, SurahNumber) -> Void
    let onHizbClick: (HizbNumber, SurahNumber) -> Void
    let onSurahBookmarkClick: (SurahNumber, VerseNumber) -> Void
    let onJuzBookmarkClick: (JuzNumber, SurahNumber, VerseNumber) -> Void
    let onHizbBookmarkClick: (HizbNumber, SurahNumber, VerseNumber) -> Void
    
    private func modifier<Value: Hashable>() -> PlainTableModifier<Value> {
        PlainTableModifier<Value>(
            backgroundColor: .appBackground,
            separatorStyle: .singleLine
        )
    }
    
    var body: some View {
        switch quranContentType {
            case .surah:
                PlainTableView(
                    modifier: modifier(),
                    values: surahs,
                    onRowClick: { onSurahClick($0.number) },
                    header: {
                        TableViewHeader(
                            bookmark: surahVersePreferences.surahVerseBookmark,
                            listTitle: stringResource(.allSurah)
                        ) { bookmark in
                            SurahBookmarkCard(
                                surahVerse: bookmark,
                                onClick: {
                                    onSurahBookmarkClick(
                                        bookmark.surah.number,
                                        bookmark.verse.verseNumber
                                    )
                                }
                            )
                        }
                    }
                ) { surah in
                    SurahListItem(surah: surah)
                }

            case .juz:
                PlainTableView(
                    modifier: modifier(),
                    values: allJuz,
                    onRowClick: { juz in
                        onJuzClick(
                            juz.number,
                            juz.firstSurahVerse.surah.number
                        )
                    },
                    header: {
                        TableViewHeader(
                            bookmark: surahVersePreferences.surahVerseBookmark,
                            listTitle: stringResource(.allJuz)
                        ) { bookmark in
                            JuzBookmarkCard(
                                surahVerse: bookmark,
                                onClick: {
                                    onJuzBookmarkClick(
                                        bookmark.verse.juzNumber,
                                        bookmark.surah.number,
                                        bookmark.verse.verseNumber
                                    )
                                }
                            )
                        }
                    }
                ) { juz in
                    JuzListItem(surahVerse: juz.firstSurahVerse)
                }

            case .hizb:
                PlainTableView(
                    modifier: modifier(),
                    values: allHizb,
                    onRowClick: { hizb in
                        onHizbClick(
                            hizb.number,
                            hizb.firstSurahVerse.surah.number
                        )
                    },
                    header: {
                        TableViewHeader(
                            bookmark: surahVersePreferences.surahVerseBookmark,
                            listTitle: stringResource(.allHizb)
                        ) { bookmark in
                            HizbBookmarkCard(
                                surahVerse: bookmark,
                                onClick: {
                                    onJuzBookmarkClick(
                                        bookmark.verse.hizbNumber,
                                        bookmark.surah.number,
                                        bookmark.verse.verseNumber
                                    )
                                }
                            )
                        }
                    }
                ) { hizb in
                    HizbListItem(surahVerse: hizb.firstSurahVerse)
                }
            }
    }
}

private struct TableViewHeader<Content: View>: View {
    let bookmark: SurahVerse?
    let listTitle: String
    let bookmarkContent: (SurahVerse) -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            if let bookmark {
                VStack(alignment: .leading, spacing: dimensionResource(.mediumPadding)) {
                    SectionTitle(stringResource(.lastRead))
                    bookmarkContent(bookmark)
                }
                .padding(.bottom)
            }
            
            SectionTitle(listTitle)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom)
    }
}

#Preview {
    NavigationStack {
        QuranView(
            surahs: surahFixtures,
            allJuz: juzFixtures,
            allHizb: hizbFixtures,
            surahVersePreferences: surahVersePreferencesFixture,
            quranContentType: QuranViewModel.QuranContentType.surah,
            onQuranContentTypeChange: {_ in},
            onSurahClick: {_ in },
            onJuzClick: {_,_ in },
            onHizbClick: {_, _ in },
            onSurahBookmarkClick: {_,_ in },
            onJuzBookmarkClick: { _,_,_ in },
            onHizbBookmarkClick: {_,_,_ in },
            onSearchClick: {}
        )
    }
    .environment(\.managedObjectContext, HassanDatabaseContainer.preview.container.viewContext)
}
