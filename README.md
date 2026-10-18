# gRPC Polyglot Lab

Proyek ini mendemonstrasikan komunikasi inter-service berbasis gRPC menggunakan arsitektur Polyglot (Go Server, Python Client, dan Node.js Client).

## Analisis Pendekatan Kompilasi Protobuf (Static vs Dynamic)

Dalam praktikum ini, terdapat dua pendekatan berbeda dalam memproses berkas skema `.proto`:

1. **Static Code Generation (Digunakan pada Go & Python):**
   Pendekatan ini menggunakan compiler `protoc` untuk menghasilkan kode sumber native (`.go` dan `_pb2.py`) sebelum aplikasi dijalankan (build time). Keunggulannya adalah tersedianya type-checking yang ketat, autocomplete pada IDE, serta pemrosesan awal yang lebih cepat saat runtime karena tidak ada overhead parsing file skema secara berulang.

2. **Dynamic Runtime Generation (Digunakan pada Node.js):**
   Pendekatan ini memanfaatkan pustaka `@grpc/proto-loader` untuk membaca dan melakukan parsing berkas `user.proto` secara langsung saat aplikasi baru dijalankan (runtime). Keunggulannya adalah fleksibilitas tinggi dan alur pengembangan yang lebih ringkas tanpa perlu mengeksekusi langkah kompilasi manual setiap kali ada perubahan skema, meskipun mengorbankan sedikit overhead pemrosesan saat aplikasi startup.
