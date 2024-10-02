<?php
// Konfigurasi database
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'psb';

// Koneksi ke database
$koneksi = mysqli_connect($host, $username, $password, $database);

// Cek koneksi
if (!$koneksi) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Pengolahan data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = password_hash($_POST["password"], PASSWORD_BCRYPT); // Enkripsi password

    // Query untuk insert data
    $query = "INSERT INTO users (username, password, role) VALUES ('$username', '$password', 'user')";

    // Eksekusi query
    if (mysqli_query($koneksi, $query)) {
        echo "Pendaftaran berhasil! <a href='login.html'>Login</a>";
    } else {
        echo "Error: " . $query . "<br>" . mysqli_error($koneksi);
    }
}

// Tutup koneksi
mysqli_close($koneksi);
?>

<?php
// Konfigurasi database
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'psb';

// Koneksi ke database
$koneksi = mysqli_connect($host, $username, $password, $database);

// Cek koneksi
if (!$koneksi) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Pengolahan data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Query untuk cek username
    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = mysqli_query($koneksi, $query);

    // Cek hasil query
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        if (password_verify($password, $row['password'])) {
            // Jika username dan password benar, maka redirect ke halaman admin
            header("Location: admin.php");
        } else {
            echo "Password salah!";
        }
    } else {
        echo "Username tidak ditemukan!";
    }
}

// Tutup koneksi
mysqli_close($koneksi);
?>
