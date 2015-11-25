CREATE TABLE WT_Asisten (
  AS_NIM VARCHAR(20) NOT NULL AUTO_INCREMENT,
  WT_Ruang_Kelas_idKelas VARCHAR(20) NOT NULL,
  Nama VARCHAR(45) NULL,
  Kontak VARCHAR(20) NULL,
  Password_2 VARCHAR(20) NULL,
  idLevel INTEGER UNSIGNED NULL,
  PRIMARY KEY(AS_NIM),
  INDEX WT_Asisten_FKIndex1(WT_Ruang_Kelas_idKelas)
);

CREATE TABLE WT_Asisten_has_WT_Praktikan (
  WT_Asisten_AS_NIM VARCHAR(20) NOT NULL,
  WT_Praktikan_P_NIM VARCHAR(20) NOT NULL,
  PRIMARY KEY(WT_Asisten_AS_NIM, WT_Praktikan_P_NIM),
  INDEX WT_Asisten_has_WT_Praktikan_FKIndex1(WT_Asisten_AS_NIM),
  INDEX WT_Asisten_has_WT_Praktikan_FKIndex2(WT_Praktikan_P_NIM)
);

CREATE TABLE WT_Asisten_has_WT_Soal (
  WT_Asisten_AS_NIM VARCHAR(20) NOT NULL,
  WT_Soal_idSoal VARCHAR(20) NOT NULL,
  PRIMARY KEY(WT_Asisten_AS_NIM, WT_Soal_idSoal),
  INDEX WT_Asisten_has_WT_Soal_FKIndex1(WT_Asisten_AS_NIM),
  INDEX WT_Asisten_has_WT_Soal_FKIndex2(WT_Soal_idSoal)
);

CREATE TABLE WT_Jawaban (
  id_Jawab VARCHAR(20) NOT NULL AUTO_INCREMENT,
  WT_Praktikan_P_NIM VARCHAR(20) NOT NULL,
  Namafile VARCHAR(45) NULL,
  PRIMARY KEY(id_Jawab),
  INDEX WT_Jawaban_FKIndex1(WT_Praktikan_P_NIM)
);

CREATE TABLE WT_Komentar (
  id VARCHAR(20) NOT NULL AUTO_INCREMENT,
  WT_TanyaJawab_id VARCHAR(20) NOT NULL,
  Status_like INTEGER UNSIGNED NULL,
  Isi_komentar TEXT NULL,
  PRIMARY KEY(id),
  INDEX WT_Komentar_FKIndex1(WT_TanyaJawab_id)
);

CREATE TABLE WT_Pengumuman (
  idPengumuman VARCHAR(20) NOT NULL AUTO_INCREMENT,
  WT_Asisten_AS_NIM VARCHAR(20) NOT NULL,
  Judul VARCHAR(20) NULL,
  Gambar VARCHAR(45) NULL,
  Body TEXT NULL,
  Tanggal DATE NULL,
  PRIMARY KEY(idPengumuman),
  INDEX WT_Pengumuman_FKIndex1(WT_Asisten_AS_NIM)
);

CREATE TABLE WT_Praktikan (
  P_NIM VARCHAR(20) NOT NULL AUTO_INCREMENT,
  Password_2 VARCHAR(20) NULL,
  Nama VARCHAR(45) NULL,
  Kelas VARCHAR(20) NULL,
  Nilai DOUBLE NULL,
  PRIMARY KEY(P_NIM)
);

CREATE TABLE WT_Ruang_Kelas (
  idKelas VARCHAR(20) NOT NULL AUTO_INCREMENT,
  Ruang VARCHAR(20) NULL,
  Hari DATE NULL,
  Jam DATETIME NULL,
  Status_2 VARCHAR(20) NULL,
  PRIMARY KEY(idKelas)
);

CREATE TABLE WT_Soal (
  idSoal VARCHAR(20) NOT NULL AUTO_INCREMENT,
  Judul VARCHAR(45) NULL,
  Isi TEXT NULL,
  idLevel INTEGER UNSIGNED NULL,
  PRIMARY KEY(idSoal)
);

CREATE TABLE WT_TanyaJawab (
  id VARCHAR(20) NOT NULL AUTO_INCREMENT,
  WT_Asisten_AS_NIM VARCHAR(20) NOT NULL,
  WT_Praktikan_P_NIM VARCHAR(20) NOT NULL,
  Pertanyaan TEXT NULL,
  Judul VARCHAR(45) NULL,
  PRIMARY KEY(id),
  INDEX WT_TanyaJawab_FKIndex2(WT_Praktikan_P_NIM),
  INDEX WT_TanyaJawab_FKIndex2(WT_Asisten_AS_NIM)
);


