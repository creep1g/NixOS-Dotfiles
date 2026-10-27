function haccman
    set -l host thorgils@controller-irhpc.rhi.hi.is
    set -l port 28080
    set -l py /hpchome/haccman/shared_envs/haccman/bin/python
    set -l cli /hpchome/haccman/hpc-account-manager/cli.py

    set -l token (ssh $host "$py $cli web-token" | sed -n 's/^TOKEN://p')
    if test -z "$token"
        echo "No token (first-run setup not done?)"
        return 1
    end

    begin
        sleep 2
        xdg-open "http://127.0.0.1:$port/?token=$token"
    end &

    echo "Tunnel up. Ctrl+C to close."
    ssh -N -L "$port:127.0.0.1:$port" $host
end
