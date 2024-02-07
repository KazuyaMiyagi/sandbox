# Architecture diagram

<!--toc:start-->
- [Architecture diagram](#architecture-diagram)
  - [SSH 鍵の作り方](#ssh-鍵の作り方)
<!--toc:end-->

![./docs/diagrams/architecture.drawio.svg](./docs/diagrams/architecture.drawio.svg)

## SSH 鍵の作り方

```bash
mkdir tmp
ssh-keygen -t ed25519 -f tmp/datastream.key
export TF_VAR_datastream_public_key="$(cat tmp/datastream.key.pub)"
export TF_VAR_datastream_private_key="$(base64 -i tmp/datastream.key)"
```
