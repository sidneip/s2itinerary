# s2itinerary
Sistema para calculo de melhor rota.

###Dependencias
- ruby 2.1.2
- Rails 4.1.8
- sqlite3
- jbuilder

###Pendente
Refatorar controllers para redirecionar para views no jbuilder
### Instalação
```
git clone https://github.com/sidneip/s2itinerary.git
cd s2itinerary
bundle
rake db:create
rake db:migrate
rspec
rails s
```
## Utilização
####Criar mapa
```
curl -X POST 'http://localhost:3000/v1/map' -d map[name]=araraquara
{"name":"araraquara","created_at":"2015-02-03T14:32:02.466Z","updated_at":"2015-02-03T14:32:02.466Z"}
```
####Criar Rota
```
curl -X POST 'http://localhost:3000/v1/route' -d route[map]=araraquara -d route[origin]=A -d route[destination]=B -d route[distance]=10
{"origin":"A","destination":"B","distance":"10.0","created_at":"2015-02-03T14:32:40.534Z","updated_at":"2015-02-03T14:32:40.534Z","map":{"name":"araraquara"}}
```
####Buscar melhor rota
```
curl -X GET 'http://localhost:3000/v1/delivery' -d map=araraquara -d origin=A -d destination=B -d distance=10 -d efficiency=10 -d cost=2.50
{"route":["A","B"],"distance":10,"cost":2.5}
```
####Visualizar mapa e suas rotas:
```
curl -X GET 'http://localhost:3000/v1/map/araraquara'
{"name":"araraquara","routes":[{"origin":"A","destination":"B","distance":"10.0"}]}
```
####Visualizar rota
```
curl -X GET 'http://localhost:3000/v1/route' -d map=araraquara -d origin=A -d destination=B
{"map":"araraquara","route":{"origin":"A","destination":"B","distance":"10.0"}}
```