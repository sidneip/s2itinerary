# s2itinerary

-Sistema para calculo de melhor rota.

Pendente
Refatorar controllers para redirecionar para views no jbuilder

-### Instalação
-
-Siga os passos
-
-```sh
-$ git clone https://github.com/sidneip/s2itinerary.git
-$ cd s2itinerary
-$ bundle
-$ rake db:create
-$ rake db:migrate
-$ rspec
-$ rails s
-```
-
-### Utilização
-
-Criar mapa:
-
curl -X POST 'http://localhost:3000/v1/map' -d map[name]=araraquara
-
-Criar Rota
-
curl -X POST 'http://localhost:3000/v1/route' -d route[map]=araraquara -d route[origin]=A -d route[destination]=B -d route[distance]=10
-
-Buscar melhor rota
curl -X GET 'http://localhost:3000/v1/delivery' -d map=araraquara -d origin=A -d destination=B -d distance=10 -d efficiency=10 -d cost=2.50

-Visualizar mapa e suas rotas:
curl -X GET 'http://localhost:3000/v1/map/araraquara'

-Visualizar rota
curl -X GET 'http://localhost:3000/v1/route' -d map=araraquara -d origin=A -d destination=B

