<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ruang Peribadi Eksklusif</title>
    <style>
        /* Gaya Minimalis & Elegan */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f5; /* Warna latar beige yang tenang */
            color: #333;
            margin: 0; padding: 0;
            display: flex; justify-content: center; align-items: center;
            min-height: 100vh;
        }
        
        /* Skrin Kunci */
        #skrinKunci {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background-color: #1c1c1c;
            display: flex; flex-direction: column; justify-content: center; align-items: center;
            z-index: 1000;
        }
        #skrinKunci h2 { color: #f7f7f5; letter-spacing: 2px; font-weight: 400; margin-bottom: 30px; }
        #skrinKunci input {
            padding: 12px 20px; font-size: 16px; border-radius: 4px;
            border: 1px solid #444; background: #333; color: white;
            margin-bottom: 20px; text-align: center; width: 250px; outline: none;
        }
        #skrinKunci button {
            padding: 12px 30px; background-color: #d4af37; color: #1c1c1c;
            border: none; border-radius: 4px; font-size: 16px; font-weight: bold;
            cursor: pointer; transition: 0.3s;
        }
        #skrinKunci button:hover { background-color: #c5a028; }
        #mesejRalat { color: #e74c3c; margin-top: 15px; display: none; font-size: 14px; }

        /* Aplikasi Utama */
        #aplikasiUtama {
            display: none; background: white; width: 90%; max-width: 850px;
            padding: 40px; border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            margin: 20px 0;
        }
        .header-app { text-align: center; margin-bottom: 30px; border-bottom: 1px solid #eaeaea; padding-bottom: 20px; }
        .header-app h2 { margin: 0; color: #2c3e50; font-weight: 300; letter-spacing: 1px; }
        
        .tabs { display: flex; justify-content: center; gap: 15px; margin-bottom: 30px; }
        .tab-btn {
            padding: 10px 20px; border: 1px solid #eaeaea; background: #fafafa;
            cursor: pointer; font-size: 15px; color: #777; border-radius: 30px; transition: all 0.3s;
        }
        .tab-btn.active { background: #2c3e50; color: white; border-color: #2c3e50; }
        
        .content { display: none; animation: fadeIn 0.5s; }
        .content.active { display: block; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(5px); } to { opacity: 1; transform: translateY(0); } }
        
        textarea {
            width: 100%; height: 250px; padding: 20px; border: 1px solid #eaeaea;
            border-radius: 8px; font-size: 15px; line-height: 1.6; resize: none; box-sizing: border-box;
            background: #fdfdfd; font-family: inherit;
        }
        textarea:focus { outline: none; border-color: #d4af37; background: white; }
        
        input[type="date"] {
            padding: 10px; border: 1px solid #eaeaea; border-radius: 5px; margin-bottom: 15px; font-family: inherit;
        }

        .btn-kumpulan { display: flex; align-items: center; margin-top: 15px; gap: 15px; }
        button.save-btn {
            padding: 12px 25px; background-color: #2c3e50; color: white;
            border: none; border-radius: 4px; cursor: pointer; font-size: 15px; transition: 0.3s;
        }
        button.save-btn:hover { background-color: #1a252f; }
        .status-mesej { font-size: 14px; font-weight: 500; }

        /* Album & Audio */
        .pusat-kandungan { text-align: center; padding: 30px 0; border: 1px dashed #ccc; border-radius: 8px; background: #fafafa; }
        .pusat-kandungan input[type="file"] { margin-top: 15px; }
        #pemainAudio { margin-top: 20px; width: 100%; max-width: 400px; }
        .galeri-grid { display: flex; gap: 15px; flex-wrap: wrap; margin-top: 20px; justify-content: center; }
        .galeri-grid img { width: 150px; height: 150px; object-fit: cover; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    </style>
</head>
<body>

<div id="skrinKunci">
    <h2>RUANG PERIBADI</h2>
    <input type="password" id="inputKataLaluan" placeholder="Masukkan Kata Laluan">
    <button onclick="semakKataLaluan()">LOG MASUK</button>
    <p id="mesejRalat">Akses Ditolak. Sila cuba lagi.</p>
</div>

<div id="aplikasiUtama">
    <div class="header-app">
        <h2>Papan Pemuka Peribadi</h2>
    </div>
    
    <div class="tabs">
        <button class="tab-btn active" onclick="openTab('diari')">Diari</button>
        <button class="tab-btn" onclick="openTab('nota')">Kalendar & Peringatan</button>
        <button class="tab-btn" onclick="openTab('album')">Album Visual</button>
        <button class="tab-btn" onclick="openTab('audio')">Pemain Audio</button>
    </div>

    <div id="diari" class="content active">
        <textarea id="teksDiari" placeholder="Tulis catatan diari anda hari ini..."></textarea>
        <div class="btn-kumpulan">
            <button class="save-btn" onclick="hantarKeEmail('diari', 'teksDiari')">Simpan & E-mel</button>
            <span id="statusDiari" class="status-mesej"></span>
        </div>
    </div>

    <div id="nota" class="content">
        <label style="display:block; margin-bottom:5px; color:#555;">Pilih Tarikh Peringatan:</label>
        <input type="date" id="tarikhPeringatan">
        <textarea id="teksNota" placeholder="Senaraikan peringatan, acara kalendar, atau nota penting..."></textarea>
        <div class="btn-kumpulan">
            <button class="save-btn" onclick="hantarKeEmail('nota & peringatan', 'teksNota')">Simpan & E-mel</button>
            <span id="statusNota" class="status-mesej"></span>
        </div>
    </div>

    <div id="album" class="content">
        <div class="pusat-kandungan">
            <p style="color:#666; margin:0;">Pilih gambar dari peranti anda untuk tatapan sementara.</p>
            <p style="font-size:12px; color:#999;">(Gambar tidak di-emelkan untuk menjaga kestabilan sistem)</p>
            <input type="file" id="fileGambar" accept="image/*" multiple onchange="paparGambar(event)">
            <div class="galeri-grid" id="ruangGaleri"></div>
        </div>
    </div>

    <div id="audio" class="content">
        <div class="pusat-kandungan">
            <p style="color:#666; margin:0;">Pilih runut bunyi (MP3) untuk menemani waktu anda.</p>
            <input type="file" id="fileAudio" accept="audio/*" onchange="mainkanAudio(event)">
            <br>
            <audio id="pemainAudio" controls></audio>
        </div>
    </div>
</div>

<script>
    // --- 1. TETAPAN GOOGLE SCRIPT URL ---
    const googleScriptURL = "https://script.google.com/macros/s/AKfycbzeVg8UdVZxpxPZ3427yMEvUL6Aq6oYqwRA29zD8qD8CYZZa0S6eAm2vlGLsQQF-XRq/exec"; 

    // --- 2. FUNGSI KUNCI (Password: rahsia123) ---
    function semakKataLaluan() {
        let passwordDiisi = document.getElementById('inputKataLaluan').value;
        if (passwordDiisi === "rahsia123") {
            document.getElementById('skrinKunci').style.display = 'none';
            document.getElementById('aplikasiUtama').style.display = 'block';
        } else {
            document.getElementById('mesejRalat').style.display = 'block';
        }
    }

    // Enter key untuk Log Masuk
    document.getElementById("inputKataLaluan").addEventListener("keypress", function(event) {
        if (event.key === "Enter") { event.preventDefault(); semakKataLaluan(); }
    });

    // --- 3. FUNGSI TUKAR TAB ---
    function openTab(tabName) {
        document.querySelectorAll('.content').forEach(el => el.classList.remove('active'));
        document.querySelectorAll('.tab-btn').forEach(el => el.classList.remove('active'));
        document.getElementById(tabName).classList.add('active');
        event.currentTarget.classList.add('active');
    }

    // --- 4. FUNGSI HANTAR DATA KE EMAIL VIA GOOGLE SCRIPT ---
    function hantarKeEmail(kunci, idElemen) {
        let kandungan = document.getElementById(idElemen).value;
        let tarikh = document.getElementById('tarikhPeringatan') ? document.getElementById('tarikhPeringatan').value : "";
        let statusId = kunci === 'diari' ? 'statusDiari' : 'statusNota';
        let status = document.getElementById(statusId);
        
        if(kandungan.trim() === "") {
            status.style.color = "#e74c3c"; // Merah
            status.innerText = "Ruangan kosong. Sila tulis sesuatu.";
            setTimeout(() => status.innerText = "", 3000);
            return;
        }

        status.style.color = "#2980b9"; // Biru
        status.innerText = "Sedang menyulitkan dan menghantar...";

        // Objek data yang dihantar
        let dataPayload = new URLSearchParams({
            'jenis': kunci,
            'kandungan': kandungan,
            'tarikh': tarikh
        });

        fetch(googleScriptURL, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: dataPayload
        })
        .then(response => response.text())
        .then(result => {
            status.style.color = "#27ae60"; // Hijau
            status.innerText = "Berjaya dihantar ke e-mel secara automatik!";
            document.getElementById(idElemen).value = ""; // Kosongkan selepas berjaya
            if(document.getElementById('tarikhPeringatan')) document.getElementById('tarikhPeringatan').value = "";
            setTimeout(() => status.innerText = "", 4000);
        })
        .catch(error => {
            status.style.color = "#e74c3c";
            status.innerText = "Gagal. Sila semak sambungan internet atau URL Google Script.";
            setTimeout(() => status.innerText = "", 5000);
        });
    }

    // --- 5. FUNGSI ALBUM GAMBAR (LOKAL) ---
    function paparGambar(event) {
        let fail = event.target.files;
        let galeri = document.getElementById('ruangGaleri');
        galeri.innerHTML = ""; // Bersihkan galeri sedia ada
        
        for(let i = 0; i < fail.length; i++) {
            let img = document.createElement("img");
            img.src = URL.createObjectURL(fail[i]);
            galeri.appendChild(img);
        }
    }

    // --- 6. FUNGSI PEMAIN AUDIO ---
    function mainkanAudio(event) {
        let fail = event.target.files[0];
        if (fail) {
            let pautanFail = URL.createObjectURL(fail);
            let pemain = document.getElementById('pemainAudio');
            pemain.src = pautanFail;
            pemain.play();
        }
    }
</script>

</body>
</html>