FROM perl:5.38

WORKDIR /app

RUN cpanm --notest Mojolicious

COPY setup_data.pl app.pl ./

RUN perl setup_data.pl

ENV PORT=3000
EXPOSE 3000

CMD perl app.pl daemon -l http://0.0.0.0:$PORT

