
# Count IP Addresses   (5kyu)
def ip_to_int(ip)
  ip.split('.').map(&:to_i).reduce(0) { |acc, octet| (acc << 8) + octet }
end

def ipsBetween(start_ip, end_ip)
  start_int = ip_to_int(start_ip)
  end_int = ip_to_int(end_ip)
  end_int - start_int
end

# Not very secure
def alphanumeric?(str)
  !str.empty? && str.match?(/^[A-Za-z0-9]+$/) && !str.match?(/[ _]/)
end
