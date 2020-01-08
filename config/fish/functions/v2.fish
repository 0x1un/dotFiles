function v2 -d "Open proxy in fish shell"
    nohup v2ray >> ~/Log/v2ray.log 2>&1 &; echo "v2ray running in background."
end
