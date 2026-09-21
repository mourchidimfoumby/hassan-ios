//
//  Fixture.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

let surahFixture = Surah(
    number: 1,
    name: "الفاتحة",
    transliteration: "Al-Fatihah",
    type: "Meccan",
    totalVerses: 7,
    translation: "The Opener"
)

let surahFixture2 = Surah(
    number: 2,
    name: "البقرة",
    transliteration: "Al-Baqarah",
    type: "medinan",
    totalVerses: 286,
    translation: "The Cow"
)

let surahFixture3 = Surah(
    number: 113,
    name: "الفلق",
    transliteration: "Al-Falaq",
    type: "meccan",
    totalVerses: 5,
    translation: "The Daybreak"
)

let surahFixtures = [
    surahFixture,
    Surah(
        number: 2,
        name: "البقرة",
        transliteration: "Al-Baqarah",
        type: "Meccan",
        totalVerses: 286,
        translation: "The Cow"
    ),
    Surah(
        number: 3,
        name: "آل عمران",
        transliteration: "Ali 'Imran",
        type: "Medinan",
        totalVerses: 200,
        translation: "Family of Imran"
    ),
    Surah(
        number: 4,
        name: "النساء",
        transliteration: "Al-Nisa",
        type: "Medinan",
        totalVerses: 176,
        translation: "The Women"
    ),
    Surah(
        number: 5,
        name: "المائدة",
        transliteration: "Al-Ma'idah",
        type: "Medinan",
        totalVerses: 120,
        translation: "The Table Spread"
    )
]

let verseFixture = Verse(
    verseNumber: 1,
    surahNumber: 1,
    text: "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
    transliteration: "Bismi Allahi alrrahmani alrraheemi",
    page: 1,
    juzNumber: 1,
    hizbNumber: 1
)

let verseFixture2 = Verse(
    verseNumber: 255,
    surahNumber: 2,
    text: "ٱللَّهُ لَآ إِلَـٰهَ إِلَّا هُوَ ٱلْحَىُّ ٱلْقَيُّومُ ۚ لَا تَأْخُذُهُۥ سِنَةٌۭ وَلَا نَوْمٌۭ ۚ لَّهُۥ مَا فِى ٱلسَّمَـٰوَٰتِ وَمَا فِى ٱلْأَرْضِ ۗ مَن ذَا ٱلَّذِى يَشْفَعُ عِندَهُۥٓ إِلَّا بِإِذْنِهِۦ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَىْءٍۢ مِّنْ عِلْمِهِۦٓ إِلَّا بِمَا شَآءَ ۚ وَسِعَ كُرْسِيُّهُ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضَ ۖ وَلَا يَـُٔودُهُۥ حِفْظُهُمَا ۚ وَهُوَ ٱلْعَلِىُّ ٱلْعَظِيمُ",
    transliteration: "Allahu la ilaha illa huwa alhayyu alqayyoomu la takhuthuhu sinatun wala nawmun lahu ma fee alssamawati wama fee alardi man tha allathee yashfaAAu AAindahu illa biithnihi yaAAlamu ma bayna aydeehim wama khalfahum wala yuheetoona bishayin min AAilmihi illa bima shaa wasiAAa kursiyyuhu alssamawati waalarda wala yaooduhu hifthuhuma wahuwa alAAaliyyu alAAatheemu",
    page: 42,
    juzNumber: 3,
    hizbNumber: 5
)

let verseFixtures = [
    Verse(
        verseNumber: 1,
        surahNumber: 1,
        text: "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
        transliteration: "Bismi Allahi alrrahmani alrraheemi",
        page: 1,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 2,
        surahNumber: 1,
        text: "ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَـٰلَمِينَ",
        transliteration: "Alhamdu lillahi rabbi alAAalameena",
        page: 1,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 3,
        surahNumber: 1,
        text: "ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
        transliteration: "Alrrahmani alrraheemi",
        page: 1,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 4,
        surahNumber: 1,
        text: "مَـٰلِكِ يَوْمِ ٱلدِّينِ",
        transliteration: "Maliki yawmi alddeeni",
        page: 1,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 5,
        surahNumber: 1,
        text: "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
        transliteration: "Iyyaka naAAbudu waiyyaka nastaAAeenu",
        page: 1,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 6,
        surahNumber: 1,
        text: "ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ",
        transliteration: "Ihdina alssirata almustaqeema",
        page: 1,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 7,
        surahNumber: 1,
        text: "صِرَٰطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ ٱلْمَغْضُوبِ عَلَيْهِمْ وَلَا ٱلضَّآلِّينَ",
        transliteration: "Sirata allatheena anAAamta AAalayhim ghayri almaghdoobi AAalayhim wala alddalleena",
        page: 1,
        juzNumber: 1,
        hizbNumber: 1
    )
]

let verseFixtures2 = [
    Verse(
        verseNumber: 1,
        surahNumber: 2,
        text: "الٓمٓ",
        transliteration: "Aliflammeem",
        page: 2,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 2,
        surahNumber: 2,
        text: "ذَٰلِكَ ٱلۡكِتَٰبُ لَا رَيۡبَۛ فِيهِۛ هُدٗى لِّلۡمُتَّقِينَ",
        transliteration: "Thalika alkitabu la rayba feehi hudan lilmuttaqeena",
        page: 2,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 3,
        surahNumber: 2,
        text: "ٱلَّذِينَ يُؤۡمِنُونَ بِٱلۡغَيۡبِ وَيُقِيمُونَ ٱلصَّلَوٰةَ وَمِمَّا رَزَقۡنَٰهُمۡ يُنفِقُونَ",
        transliteration: "Allatheena yuminoona bialghaybi wayuqeemoona alssalata wamimma razaqnahum yunfiqoona",
        page: 2,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 4,
        surahNumber: 2,
        text: "وَٱلَّذِينَ يُؤۡمِنُونَ بِمَآ أُنزِلَ إِلَيۡكَ وَمَآ أُنزِلَ مِن قَبۡلِكَ وَبِٱلۡأٓخِرَةِ هُمۡ يُوقِنُونَ",
        transliteration: "Waallatheena yuminoona bima onzila ilayka wama onzila min qablika wabialakhirati hum yooqinoona",
        page: 2,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 5,
        surahNumber: 2,
        text: "أُوْلَـٰٓئِكَ عَلَىٰ هُدٗى مِّن رَّبِّهِمۡۖ وَأُوْلَـٰٓئِكَ هُمُ ٱلۡمُفۡلِحُونَ",
        transliteration: "Olaika AAala hudan min rabbihim waolaika humu almuflihoona",
        page: 2,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 6,
        surahNumber: 2,
        text: "إِنَّ ٱلَّذِينَ كَفَرُواْ سَوَآءٌ عَلَيۡهِمۡ ءَأَنذَرۡتَهُمۡ أَمۡ لَمۡ تُنذِرۡهُمۡ لَا يُؤۡمِنُونَ",
        transliteration: "Inna allatheena kafaroo sawaon AAalayhim aanthartahum am lam tunthirhum la yuminoona",
        page: 3,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 7,
        surahNumber: 2,
        text: "خَتَمَ ٱللَّهُ عَلَىٰ قُلُوبِهِمۡ وَعَلَىٰ سَمۡعِهِمۡۖ وَعَلَىٰٓ أَبۡصَٰرِهِمۡ غِشَٰوَةٞۖ وَلَهُمۡ عَذَابٌ عَظِيمٞ",
        transliteration: "Khatama Allahu AAala quloobihim waAAala samAAihim waAAala absarihim ghishawatun walahum AAathabun AAatheemun",
        page: 3,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 8,
        surahNumber: 2,
        text: "وَمِنَ ٱلنَّاسِ مَن يَقُولُ ءَامَنَّا بِٱللَّهِ وَبِٱلۡيَوۡمِ ٱلۡأٓخِرِ وَمَا هُم بِمُؤۡمِنِينَ",
        transliteration: "Wamina alnnasi man yaqoolu amanna biAllahi wabialyawmi alakhiri wama hum bimumineena",
        page: 3,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 9,
        surahNumber: 2,
        text: "يُخَٰدِعُونَ ٱللَّهَ وَٱلَّذِينَ ءَامَنُواْ وَمَا يَخۡدَعُونَ إِلَّآ أَنفُسَهُمۡ وَمَا يَشۡعُرُونَ",
        transliteration: "YukhadiAAoona Allaha waallatheena amanoo wama yakhdaAAoona illa anfusahum wama yashAAuroona",
        page: 3,
        juzNumber: 1,
        hizbNumber: 1
    ),
    Verse(
        verseNumber: 10,
        surahNumber: 2,
        text: "فِي قُلُوبِهِم مَّرَضٞ فَزَادَهُمُ ٱللَّهُ مَرَضٗاۖ وَلَهُمۡ عَذَابٌ أَلِيمُۢ بِمَا كَانُواْ يَكۡذِبُونَ",
        transliteration: "Fee quloobihim maradun fazadahumu Allahu maradan walahum AAathabun aleemun bima kanoo yakthiboona",
        page: 3,
        juzNumber: 1,
        hizbNumber: 1
    )
]

let verseFixtures3 = [
    Verse(
        verseNumber: 1,
        surahNumber: 113,
        text: "قُلۡ أَعُوذُ بِرَبِّ ٱلۡفَلَقِ",
        transliteration: "Qul aAAoothu birabbi alfalaqi",
        page: 604,
        juzNumber: 30,
        hizbNumber: 60
    ),
    Verse(
        verseNumber: 2,
        surahNumber: 113,
        text: "مِن شَرِّ مَا خَلَقَ",
        transliteration: "Min sharri ma khalaqa",
        page: 604,
        juzNumber: 30,
        hizbNumber: 60
    ),
    Verse(
        verseNumber: 3,
        surahNumber: 113,
        text: "وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ",
        transliteration: "Wamin sharri ghasiqin itha waqaba",
        page: 604,
        juzNumber: 30,
        hizbNumber: 60
    ),
    Verse(
        verseNumber: 4,
        surahNumber: 113,
        text: "وَمِن شَرِّ ٱلنَّفَّـٰثَٰتِ فِي ٱلۡعُقَدِ",
        transliteration: "Wamin sharri alnnaffathati fee alAAuqadi",
        page: 604,
        juzNumber: 30,
        hizbNumber: 60
    ),
    Verse(
        verseNumber: 5,
        surahNumber: 113,
        text: "وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ",
        transliteration: "Wamin sharri hasidin itha hasada",
        page: 604,
        juzNumber: 30,
        hizbNumber: 60
    )
]

let surahVerseFixture = SurahVerse(
    surah: surahFixture,
    verse: verseFixture
)

let surahVerseFixture2 = SurahVerse(
    surah: surahFixture2,
    verse: verseFixture2
)

let surahVerseFixtures = verseFixtures.map {
    SurahVerse(
        surah: surahFixture,
        verse: $0
    )
}

let surahVerseFixtures2 = verseFixtures2.map {
    SurahVerse(
        surah: surahFixture,
        verse: $0
    )
}

let surahVerseFixtures3 = verseFixtures3.map {
    SurahVerse(
        surah: surahFixture3,
        verse: $0
    )
}

let juzFixture = Juz(
    number: surahVerseFixture.verse.juzNumber,
    firstSurahVerse: surahVerseFixture
)

let juzFixtures = surahVerseFixtures.map {
    Juz(
        number: $0.verse.juzNumber,
        firstSurahVerse: $0
    )
}

let hizbFixture = Hizb(
    number: surahVerseFixture.verse.hizbNumber,
    firstSurahVerse: surahVerseFixture
)

let hizbFixtures = surahVerseFixtures.map {
    Hizb(
        number: $0.verse.hizbNumber,
        firstSurahVerse: $0
    )
}

let reciterFixture = Reciter(
    id: "1",
    name: "Mishary Rashid Al-Afasy",
    imageUrl: "https://cdn.alfaqr.com/images/reciters/mishary-rashid-alafasy-profile.jpeg"
)

let reciterFixtures = [
    reciterFixture,
    Reciter(
        id: "2",
        name: "Abdul Basit Abdul Samad (Murattal)",
        imageUrl: "https://quran-uni.com/wp-content/uploads/abdulbasit-abdulsamad-300x300.jpg"
    ),
    Reciter(
        id: "3",
        name: "Abdul Rahman Al-Sudais",
        imageUrl: "https://www.assabile.com/media/person/200x256/abdul-rahman-al-sudais.png"
    ),
    Reciter(
        id: "4",
        name: "Abu Bakr Al-Shatri",
        imageUrl: "https://cdn.alfaqr.com/images/reciters/abu-bakr-al-shatri-pofile.jpeg"
    ),
    Reciter(
        id: "5",
        name: "Ahmad Al-Ajmi",
        imageUrl: "https://www.assabile.com/media/person/200x256/ahmed-al-ajmi.png"
    ),
    Reciter(
        id: "6",
        name: "Saad Al Ghamdi",
        imageUrl: "https://static.qurancdn.com/images/reciters/16/saad-al-ghamdi-profile.png?v=1"
    ),
    Reciter(
        id: "7",
        name: "Hani Ar-Rifai",
        imageUrl: "https://www.assajda.com/media/person/square/hani-ar-rifai.jpg"
    ),
    Reciter(
        id: "8",
        name: "Ibrahim Al-Akhdar",
        imageUrl: "https://fr.assabile.com/media/person/200x256/ibrahim-al-akdar.png"
    ),
    Reciter(
        id: "9",
        name: "Maher Al-Muaiqly",
        imageUrl: "https://www.assabile.com/media/person/280x219/maher-al-mueaqly.png"
    ),
    Reciter(
        id: "10",
        name: "Muhammad Ayyub",
        imageUrl: "https://upload.wikimedia.org/wikipedia/en/4/40/Muhammad_Ayyub.jpeg"
    )
]

let surahVersePreferencesFixture = Constants.defaultSurahVersePreferences.copy {
    $0.displayMode = SurahVersePreferences.DisplayMode.list
    $0.translationLanguage = Language.english
    $0.displayTranslation = true
    $0.reciter = reciterFixture
    $0.audioAutomaticScrolling = true
    $0.surahVerseBookmark = surahVerseFixture2
}
