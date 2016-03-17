#!/bin/bash
tshark -i any -Y 'http.request' -T fields -e http.request.method -e http.request.uri -e ip.src
