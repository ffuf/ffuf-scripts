# Scripts and snippets for ffuf payloads

A collection of scripts that enable different kinds of payloads to be used with [ffuf](https://github.com/ffuf/ffuf).

### ffuf_basicauth.sh - HTTP Basic authentication

A script that generates base64 encoded combinations of username:password values in the provided wordlists. Iterates through every possible combination.

#### Example usage

Test each HTTP basic authentication username:password combination in https://example.org/endpoint, and filter out 403 - Forbidden responses.

```
./ffuf_basicauth.sh usernames.txt passwords.txt |ffuf -w -:AUTH -u https://example.org/endpoint -H "Authorization: Basic AUTH" -fc 403 -c
```

### Cook - HTTP Basic authentication

Test each HTTP basic authentication username:password combination in https://example.org/endpoint, and filter out 403 - Forbidden responses.

```
cook fz-http_default_users.txt : fz-http_default_pass.txt -m b64e | ffuf -u https://example.org/endpoint -w -:AUTH -H "Authorization: Basic AUTH" -fc 403
```

### fuff only - HTTP Basic authentication

Test each HTTP basic authentication username:password combination in https://example.org/endpoint, and filter out 403 - Forbidden responses.

```
ffuf -u https://USER:PASS@example.org/endpoint -w /usr/share/fuzzdb/wordlists-user-passwd/generic-listpairs/http_default_users.txt:USER -w /usr/share/fuzzdb/wordlists-user-passwd/generic-listpairs/http_default_pass.txt:PASS -fc 403
```

## Contributing

We welcome any and all contributions. Please see `ffuf_basicauth.sh` for the preferred script header format for usage examples and author information.
