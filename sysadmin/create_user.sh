USER=user
COMMENT="user name"
EXPDATE="YYYY-MM-DD"

useradd --expiredate "$EXPDATE" --create-home --comment "$COMMENT" "$USER"
passwd "$USER"
passwd -e "$USER"
