package main

import (
	"encoding/json"
	"testing"
)

var originalSalida = SalidasJoin{Id: 3, Idmedicamento: 1, Cantidad: 5, Idfarmacia: 1, Fechahora: "2014-11-29 14:10:04", Nombremedicamento: "Allegra ® pediátrico", Nombrefarmacia: "Milano"}
var testSalida = Salidas{Idmedicamento: 1, Cantidad: 666, Idfarmacia: 1}

func TestGetAllSalidas(t *testing.T) {
	resp := sendTest("salidas", "GET", "")

	CodeIs(resp, 200, t)
	ContentTypeIsJson(resp, t)
}

func TestGetSalida(t *testing.T) {
	resp := sendTest("salidas/2014-11-29/2014-11-30", "GET", "")

	CodeIs(resp, 200, t)
	ContentTypeIsJson(resp, t)

	isResponseExpected(resp, [1]SalidasJoin{originalSalida}, t)
}

func TestPostSalida(t *testing.T) {
	jsonBytes, _ := json.Marshal(testSalida)
	resp := sendTest("salidas", "POST", string(jsonBytes))

	CodeIs(resp, 200, t)
	ContentTypeIsJson(resp, t)
}
