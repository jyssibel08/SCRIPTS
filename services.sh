for service in $(systemctl list-units --type=service --state=running | awk '/.service/ && !/dbus/ {print $1}'); do
    echo "Restarting $service"
    sudo systemctl restart $service && echo "$service restarted successfully" || echo "Failed to restart $service"
done

# Manually restart OpenVPN
echo "Restarting openvpn.service"
sudo systemctl restart openvpn.service && echo "openvpn.service restarted successfully" || echo "Failed to restart openvpn.service"
