echo "Downloading Scripts"
curl -H 'Authorization: token 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' \
     -H 'Accept: application/vnd.github.v3.raw' \
     -O -L -s https://api.github.com/repos/NaluApp/iOS-Configuration/contents/Scripts/fetch_config.sh
chmod 700 fetch_config.sh

if [ "$1" = "--release" ]; then
     ./fetch_config.sh Scripts/archive.sh
     ./Scripts/archive.sh \
          Networking \
          . \
          https://AlbGarciam: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@github.com/NaluApp/Networking-Compiled.git \
          Networking-Compiled \
          $2
else
     ./fetch_config.sh Scripts/generate_project.sh
     ./Scripts/generate_project.sh
fi