# kqsfl_streaming

## Initialize on a new server
### Dependencies
- Ubuntu 24

### Setup
- Download `bootstrap` from this repository
- `chmod +x bootstrap`
- `./bootstrap`
- clone this repo
- go to the `ansible` directory of this repository
- Run `ansible-galaxy install -r requirements.yml`
- Run `ansible-playbook streambox.yml -c local -K -u stream-admin`
