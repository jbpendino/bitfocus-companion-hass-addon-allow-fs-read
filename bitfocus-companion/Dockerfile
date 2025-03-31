ARG BUILD_FROM
FROM $BUILD_FROM

# Installeer eventueel benodigde pakketten, zoals tzdata als je in een andere timezone wilt draaien
RUN apk add --no-cache tzdata

# Kopieer run.sh naar de container en maak het uitvoerbaar
COPY run.sh /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
