package main

import (
	"os"
	"net/http"
)
func main(){
        http.HandleFunc("/", returnHostName)
        http.ListenAndServe(port(), nil)
}

func port() string {
	port := os.Getenv("PORT")
	if len(port) == 0 {
		port = "80"
	}
	return ":" + port
}

func returnHostName(w http.ResponseWriter, r *http.Request){
	name, err := os.Hostname()
	if err != nil {
		panic(err)
	}
	w.Write([]byte(name))
}
