<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Forex Trading Journal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --bg-primary: #0a0a14;
            --bg-secondary: #151525;
            --bg-card: #1e1e35;
            --text-primary: #e0e0ff;
            --text-secondary: #a0a0c0;
            --accent: #6c5ce7;
            --accent-secondary: #a29bfe;
            --success: #00b894;
            --danger: #ff7675;
            --warning: #fdcb6e;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, var(--bg-primary), #1a1a2e);
            color: var(--text-primary);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background: var(--bg-card);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
        }

        .login-visual {
            flex: 1;
            background: linear-gradient(135deg, var(--accent), var(--accent-secondary));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .login-visual::before {
            content: "";
            position: absolute;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            transform: rotate(30deg);
        }

        .login-visual h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            position: relative;
            z-index: 2;
        }

        .login-visual p {
            font-size: 1.1rem;
            max-width: 400px;
            position: relative;
            z-index: 2;
            opacity: 0.9;
            line-height: 1.6;
        }

        .login-form {
            flex: 1;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 40px;
        }

        .logo i {
            font-size: 2.5rem;
            color: var(--accent);
        }

        .logo h1 {
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(90deg, var(--accent), var(--accent-secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .input-with-icon {
            position: relative;
        }

        .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-secondary);
        }

        input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            background: var(--bg-secondary);
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            color: var(--text-primary);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(108, 92, 231, 0.2);
        }

        .btn {
            padding: 15px;
            background: var(--accent);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1.1rem;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .btn:hover {
            background: #5d4de0;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(108, 92, 231, 0.3);
        }

        .btn:active {
            transform: translateY(-1px);
        }

        .form-footer {
            text-align: center;
            margin-top: 30px;
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .form-footer a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 600;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }

        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 25px;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            z-index: 1000;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            animation: slideInRight 0.3s ease;
            display: none;
        }

        @keyframes slideInRight {
            from {
                transform: translateX(100%);
            }
            to {
                transform: translateX(0);
            }
        }

        .notification.error {
            background: var(--danger);
        }

        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            
            .login-visual {
                padding: 30px 20px;
            }
            
            .login-visual h2 {
                font-size: 1.8rem;
            }
            
            .login-form {
                padding: 40px 30px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-visual">
            <h2>Forex Trading Journal</h2>
            <p>Track your trades, analyze performance, and improve your trading strategy with our advanced journaling system.</p>
        </div>
        
        <div class="login-form">
            <div class="logo">
                <i class="fas fa-chart-line"></i>
                <h1>Trader's Journal</h1>
            </div>
            
            <form id="loginForm">
                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-with-icon">
                        <i class="fas fa-user"></i>
                        <input type="text" id="username" placeholder="Enter your username" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" placeholder="Enter your password" required>
                    </div>
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
            </form>
            
            <div class="form-footer">
                <p>Don't have an account? <a href="#" id="showRegister">Register</a></p>
            </div>
        </div>
    </div>
    
    <div class="notification error" id="errorMessage">
        Invalid username or password. Please try again.
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const loginForm = document.getElementById('loginForm');
            const errorMessage = document.getElementById('errorMessage');
            
            // Check if user is already logged in
            if (localStorage.getItem('isLoggedIn') === 'true') {
                window.location.href = 'index.html';
            }
            
            loginForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                const username = document.getElementById('username').value;
                const password = document.getElementById('password').value;
                
                // Simple authentication (in a real app, this would be server-side)
                const users = JSON.parse(localStorage.getItem('users')) || [];
                const user = users.find(u => u.username === username && u.password === password);
                
                if (user) {
                    // Login successful
                    localStorage.setItem('isLoggedIn', 'true');
                    localStorage.setItem('currentUser', JSON.stringify(user));
                    window.location.href = 'index.html';
                } else {
                    // Show error message
                    errorMessage.style.display = 'block';
                    setTimeout(() => {
                        errorMessage.style.display = 'none';
                    }, 3000);
                }
            });
            
            // Registration functionality (simplified)
            document.getElementById('showRegister').addEventListener('click', function(e) {
                e.preventDefault();
                const username = prompt('Enter new username:');
                if (username) {
                    const password = prompt('Enter new password:');
                    if (password) {
                        // Create user
                        let users = JSON.parse(localStorage.getItem('users')) || [];
                        // Check if user already exists
                        if (users.some(u => u.username === username)) {
                            alert('Username already exists!');
                            return;
                        }
                        
                        users.push({ username, password });
                        localStorage.setItem('users', JSON.stringify(users));
                        alert('Registration successful! You can now login.');
                    }
                }
            });
        });
    </script>
</body>
</html>
