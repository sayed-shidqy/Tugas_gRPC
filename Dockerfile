# Menggunakan base image python resmi yang ringan
FROM python:3.12-slim

# Mengatur environment agar log Python langsung muncul di terminal
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Menetapkan direktori kerja di dalam kontainer
WORKDIR /app

# Menyalin file dependensi terlebih dahulu agar build cache optimal
COPY requirements.txt .

# Memasang pustaka dependensi
RUN pip install --no-cache-dir -r requirements.txt

# Menyalin seluruh sisa kode sumber proyek
COPY . .

# Membuat dan menggunakan pengguna non-root demi keamanan (Sesuai modul Bab 4/7)
RUN useradd -r -u 10001 appuser
USER appuser

# Membuka port yang digunakan aplikasi
EXPOSE 5000

# Menjalankan perintah utama aplikasi
CMD ["python", "app.py"]
