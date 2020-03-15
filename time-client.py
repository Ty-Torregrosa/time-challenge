#!/usr/bin/env python3
import requests, time

def do_loop(hz, dofor):
    outputs = []
    times_to_run = hz * dofor
    url = "http://timeapi.local.com/time"
    
    
    for i in range(times_to_run):
        time.sleep(1/hz)
        r = requests.get(url)
        outputs += [{"status": r.status_code, "ttlb": r.elapsed.total_seconds()}]
    return outputs


def main():
    print(do_loop(10, 1))
    
if __name__ == "__main__":
    main()
