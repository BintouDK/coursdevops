

# Utiliser une image Nginx légère
FROM nginx:alpine

# Copier le fichier HTML dans le dossier par défaut de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Exposer le port 80
EXPOSE 80
