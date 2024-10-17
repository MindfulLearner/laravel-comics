# Usa l'immagine base PHP con Apache
FROM php:8.2-apache

# Imposta la directory di lavoro
WORKDIR /var/www/html

# Abilita il Mod Rewrite di Apache
RUN a2enmod rewrite

# Installa le librerie di sistema necessarie
RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev

# Crea un utente con lo stesso UID e GID del tuo sistema host
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} mygroup && \
    useradd -m -u ${UID} -g mygroup myuser

# Assicurati che la cartella /var/www/html/data esista
RUN mkdir -p /var/www/html/data && \
    chown -R www-data:www-data /var/www/html/data && \
    chmod -R 755 /var/www/html/data && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    echo '<Directory /var/www/html/>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/conf-available/custom.conf && \
    a2enconf custom.conf

# Copia Composer dall'immagine ufficiale e rendilo disponibile
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installa le estensioni PHP necessarie
RUN docker-php-ext-install gettext intl pdo_mysql

# Configura e installa GD (libreria per la gestione di immagini)
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Passa all'utente creato per eseguire le azioni successive
USER myuser

