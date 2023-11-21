FROM golang:1.21.4-alpine3.18 AS build-stage

WORKDIR /usr/src/app

COPY . .

RUN go build -o ./fullCycle

FROM scratch

COPY --from=build-stage /usr/src/app/fullCycle /usr/src/app/fullCycle

WORKDIR /usr/src/app

ENTRYPOINT ["./fullCycle"]