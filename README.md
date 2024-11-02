# kqsfl_streaming

## Initialize on a new server
### Dependencies
- Ubuntu 24

### Setup
- Download `utils/bootstrap` from this repository
- `bash ./bootstrap`
- clone this repo
- if you are using a private email for github you can set your email as follows
  - ```gh api /user/emails | jq '.[] | select(.email | contains("noreply"))' | jq '.email'```
- go to the `ansible` directory of this repository
- Run `ansible-galaxy install -r requirements.yml`
- Run `ansible-playbook streambox.yml -c local -K -u stream-admin`
