# s2itinerary

-Sistema para calculo de melhor rota.

Pendente

Criar metodos para calculo de efiencia do caminhão
Refatorar controllers para redirecionar para view

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
-POST - http://localhost:3000/v1/map
-
-{"map":{"name":"araraquara"}}
-
-POST - http://localhost:3000/v1/route
-
-{"route":{"map":"araraquara", "origin":"A", "destination": "H", "distance":"20"}}
-
-GET - http://localhost:3000/v1/delivery?map=juasdsfdsfa&origin=A&destination=D&efficiency=10&cost=2.50
