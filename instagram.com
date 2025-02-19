<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Instagram Clone</title>
    <link rel="stylesheet" href="styles.css">
    <script defer src="script.js"></script>
</head>
<body>

    <div class="container">
        <!-- Formulario de Login -->
        <div id="login-box">
            <h2>Iniciar Sesión</h2>
            <input type="text" id="login-user" placeholder="Usuario">
            <input type="password" id="login-pass" placeholder="Contraseña"><!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Instagram Clone</title>
    <link rel="stylesheet" href="styles.css">
    <script defer src="script.js"></script>
</head>
<body>

    <header>
        <h1>Instagram Clone</h1>
        <button onclick="logout()">Cerrar Sesión</button>
    </header>

    <main>
        <h2>Bienvenido a Instagram</h2>
        <p>¡Has iniciado sesión correctamente!</p>
    </main>

</body>
</html>

            <button onclick="login()">Entrar</button>
            <p>¿No tienes cuenta? <a href="#" onclick="toggleForms()">Regístrate</a></p>
            <p id="login-error" class="error-message"></p>
        </div>

        <!-- Formulario de Registro -->
        <div id="register-box" class="hidden">
            <h2>Registro</h2>
            <input type="text" id="register-user" placeholder="Elige un usuario">
            <input type="password" id="register-pass" placeholder="Elige una contraseña">
            <button onclick="register()">Registrarse</button>
            <p>¿Ya tienes cuenta? <a href="#" onclick="toggleForms()">Inicia sesión</a></p>
            <p id="register-error" class="error-message"></p>
        </div>
    </div>

</body>
</html>
body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: #fafafa;
}

.container {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 300px;
}

h2 {
    margin-bottom: 10px;
}

input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 5px;
}

button {
    width: 100%;
    padding: 10px;
    background: #3897f0;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background: #3178c6;
}

.hidden {
    display: none;
}

.error-message {
    color: red;
    font-size: 14px;
}

/* Estilos para home */
header {
    display: flex;
    justify-content: space-between;
    padding: 15px;
    background: white;
    border-bottom: 1px solid #ddd;
}

main {
    text-align: center;
    padding: 20px;
}
// Alternar entre formularios de login y registro
function toggleForms() {
    document.getElementById("login-box").classList.toggle("hidden");
    document.getElementById("register-box").classList.toggle("hidden");
}

// Registrar usuario
function register() {
    let username = document.getElementById("register-user").value;
    let password = document.getElementById("register-pass").value;

    if (username === "" || password === "") {
        document.getElementById("register-error").textContent = "Todos los campos son obligatorios.";
        return;
    }

    // Guardar usuario en localStorage (solo para pruebas)
    localStorage.setItem("username", username);
    localStorage.setItem("password", password);

    alert("Registro exitoso. Ahora inicia sesión.");
    toggleForms(); // Cambiar al login
}

// Iniciar sesión
function login() {
    let username = document.getElementById("login-user").value;
    let password = document.getElementById("login-pass").value;

    let storedUser = localStorage.getItem("username");
    let storedPass = localStorage.getItem("password");

    if (username === storedUser && password === storedPass) {
        alert("Inicio de sesión exitoso.");
        window.location.href = "home.html"; // Redirigir a la página principal
    } else {
        document.getElementById("login-error").textContent = "Usuario o contraseña incorrectos.";
    }
}

// Cerrar sesión
function logout() {
    alert("Sesión cerrada.");
    window.location.href = "index.html"; // Volver al login
}
