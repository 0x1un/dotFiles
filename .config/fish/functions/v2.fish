function v2 -d "Open proxy in fish shell"
    nohup v2ray 2>> ~/Log/v2ray.log &; echo "v2ray running in background."
end
