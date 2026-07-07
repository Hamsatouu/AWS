#!/bin/bash

# Mise à jour du système
dnf update -y

# Installation Apache et PHP
dnf install -y httpd php

# Démarrage automatique d'Apache
systemctl start httpd
systemctl enable httpd

# Création de la page web de démonstration
cat > /var/www/html/index.php << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>TP AWS EC2 User Data</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: linear-gradient(135deg, #667eea, #764ba2); min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .container { background: white; border-radius: 20px; padding: 40px; max-width: 800px; width: 100%; box-shadow: 0 20px 60px rgba(0,0,0,0.3); }
        h1 { color: #667eea; text-align: center; }
        .status { background: #d4edda; border: 2px solid #28a745; border-radius: 10px; padding: 20px; margin: 20px 0; text-align: center; }
        .info-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-top: 20px; }
        .info-card { background: #f8f9fa; border-left: 4px solid #667eea; padding: 20px; border-radius: 8px; }
        .info-card h3 { color: #667eea; margin-bottom: 10px; }
        .badge { display: inline-block; background: #667eea; color: white; padding: 5px 15px; border-radius: 20px; font-size: 0.9em; margin-top: 10px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>TP AWS EC2 User Data</h1>
        <div class="status"><h2>Serveur déployé avec succès</h2><p>Le script User Data s'est exécuté correctement au démarrage.</p></div>
        <div class="info-grid">
            <div class="info-card"><h3>Système</h3><p><?php echo php_uname('s') . ' ' . php_uname('r'); ?></p><span class="badge"><?php echo php_uname('m'); ?></span></div>
            <div class="info-card"><h3>Serveur Web</h3><p><?php echo apache_get_version(); ?></p><span class="badge">Apache</span></div>
            <div class="info-card"><h3>PHP</h3><p>PHP <?php echo phpversion(); ?></p><span class="badge">Actif</span></div>
            <div class="info-card"><h3>Date serveur</h3><p><?php echo date('d/m/Y H:i:s'); ?></p><span class="badge">UTC</span></div>
            <div class="info-card"><h3>IP serveur</h3><p><?php echo $_SERVER['SERVER_ADDR']; ?></p><span class="badge">Privée</span></div>
            <div class="info-card"><h3>Votre IP</h3><p><?php echo $_SERVER['REMOTE_ADDR']; ?></p><span class="badge">Publique</span></div>
        </div>
    </div>
</body>
</html>
EOF

# Permissions correctes
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/

# Log de confirmation
echo "User Data exécuté avec succès le $(date)" > /var/log/userdata-success.log
