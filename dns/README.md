# DNS Container

## Objectif
Lancer un service DNS pour le projet Telecom avec Bind9.

## Image Docker utilisée
internetsystemsconsortium/bind9:latest

## Ports exposés
- 5353/UDP
- 5353/TCP

## Commande pour lancer le container
docker run -d --name dns \
-p 5353:53/udp \
-p 5353:53/tcp \
internetsystemsconsortium/bind9

## Vérification
docker ps
