import 'package:klikdaily/utils/type_fruits.dart';

String getDescriptByTypeFruit(TypeFruit type) {
  if (type == TypeFruit.cabbage) {
    return """
    Dari kandungan nutrisi ini, terlihat bahwa sayur kubis utamanya mengandung serat, vitamin, dan mineral seperti kalium. Sebagai sayuran, kol juga tergolong tinggi vitamin C.
    Namun, kol juga tidak kalah kaya kandungan zat gizi makronutrien seperti karbohidrat dan protein.
    Selain itu, ada beberapa kandungan lain yang turut melengkapi nutrisi sayur kol yaitu besi, folat, vitamin K, serta antioksidan dalam bentuk polifenol dan belerang
    """;
  } else if (type == TypeFruit.carrot) {
    return """
    Ini merupakan manfaat wortel yang paling banyak diketahui. Wortel ternyata bisa membantu seseorang melihat dengan baik dalam gelap. Wortel mengandung vitamin A yang tinggi. Vitamin A merupakan nutrisi penting untuk mencegah penyakit xerophtalmia. Xerophtalmia adalah penyakit yang menyebabkan penurunan fungsi mata dan menyebabkan seseorang sulit melihat pada kondisi cahaya yang redup. Selain itu, wortel mengandung antioksidan lutein dan 
    zeaxanthin yang bisa mencegah degenerasi makula, yaitu penyakit mata yang sering menyerang orang tua.
    """;
  } else if (type == TypeFruit.cauliflower) {
    return """
    Kol (Brasicca oleracea) adalah salah satu sayuran yang termasuk dalam kelompok brokoli, kembang kol, dan kubis. Berdasarkan warnanya, kol terbagi menjadi beberapa jenis, yaitu kol ungu, kol putih, dan kol hijau. Meski demikian, keempat jenis kol tersebut memiliki kandungan nutrisi yang tidak jauh berbeda.
    """;
  } else if (type == TypeFruit.onion) {
    return """
    Ini 5 Manfaat Bawang Putih Mentah bagi Tubuh
    “Selain sebagai bumbu masakan, kamu bisa mengonsumsi bawang putih mentah dan mendapatkan manfaatnya untuk kesehatan. Makan bawang putih mentah dapat mengobati flu, menurunkan tekanan darah dan menjaga kadar gula dalam darah. Namun perlu diketahui kalau mengonsumsi bawang putih bisa menyebabkan sensasi terbakar di tenggorokan.”

    Selama ini tentunya kamu sudah tahu kalau bawang putih memiliki banyak manfaat untuk kesehatan tubuh. Bawang putih kerap dijadikan sebagai bumbu tambahan untuk melengkapi masakan.

    Namun, benarkah makan bawang putih mentah justru lebih bisa memberikan manfaat buat tubuh? Faktanya kamu perlu tahu kalau bawang putih memiliki bau menyengat dan membuat napas bau. Makan bawang putih mentah terlalu banyak juga dapat memberikan sensasi terbakar di mulut dan tenggorokan. 

    Manfaat Mengonsumsi Bawang Putih Mentah
    Berikut adalah manfaat mengonsumsi bawang putih mentah bagi kesehatan tubuh: 

    1. Mengobati Flu 

    Bawang putih sejak lama digunakan untuk kesehatan. Manfaat kesehatan dari bawang putih mentah adalah hasil dari senyawa belerang yang terbentuk ketika siung bawang putih dicincang, dihancurkan, atau dikunyah. Salah satu manfaat bawang putih adalah bisa untuk mengobati flu. 

    Perlu diketahui, bawang putih mengandung beberapa nutrisi penting dan rendah kalori. Satu siung bawang putih mentah mengandung mangan, Vitamin C, selenium, dan sejumlah kecil serat, kalsium, tembaga, fosfor, zat besi, Vitamin B1, Vitamin B6, dan kalium.
        """;
  } else if (type == TypeFruit.potato) {
    return """
    Kandungan karbohidrat pada kentang menjadi sumber energi yang baik untuk ibu hamil. Namun, jika Anda sedang diet, 
    penting untuk tetap aktif dan berolahraga untuk mencegah kenaikan berat badan.
    """;
  } else if (type == TypeFruit.pumpkin) {
    return """
    Labu kuning mengandung beta karoten yang memberikan warna jingga pada sayur dan buah-buahan. 
    Beta karoten adalah antioksidan yang diperlukan oleh tubuh yang menghasilkan vitamin A. 
    Mengutip dari Medicalnewstoday.com, beta karoten tinggi pada buah dan sayur dapat mengurangi penyakit kronis. 
    Manfaat mengonsumsi beta karoten bisa mengurangi jenis kanker tertentu, mencegah penyakit asma, jantung dan mengurangi risiko degenerasi makula.
    """;
  } else if (type == TypeFruit.paprica) {
    return """
    Kandungan antioksidan di dalam paprika tergolong tinggi. Beberapa jenis antioksidan yang bisa ditemukan pada paprika antara lain adalah lutein dan zeaxanthin.
    Manfaat lutein dan zeaxanthin dari paprika adalah memelihara kesehatan mata serta mencegahnya dari berbagai gangguan, seperti katarak dan degenerasi makula.
    Tak hanya itu, paprika juga mengandung vitamin A, C, dan E yang juga baik untuk menjaga kesehatan mata Anda.
    """;
  } else if (type == TypeFruit.tomato) {
    return """
    Tomat dikenal sebagai buah yang rendah kalori dan lemak serta kaya akan vitamin dan mineral, 
    seperti vitamin A, vitamin C, folat, dan kalium. Buah ini juga mengandung berbagai antioksidan, seperti likopen, lutein, dan zeaxanthin.
    """;
  } else {
    return "";
  }
}
