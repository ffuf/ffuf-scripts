# Scripts and snippets for ffuf payloads

A collection of scripts that enable different kinds of payloads to be used with [ffuf](https://github.com/ffuf/ffuf).

### ffuf_basicauth.sh - HTTP Basic authentication

A script that generates base64 encoded combinations of username:password values in the provided wordlists. Iterates through every possible combination.

#### Example usage
Test each HTTP basic authentication username:password combination in https://example.org/endpoint, and filter out 403 - Forbidden responses.

```
./ffuf_basicauth.sh usernames.txt passwords.txt |ffuf -w -:AUTH -u https://example.org/endpoint -H "Authorization: Basic AUTH" -fc 403 -c
```

## Contributing

We welcome any and all contributions. Please see `ffuf_basicauth.sh` for the preferred script header format for usage examples and author information.
