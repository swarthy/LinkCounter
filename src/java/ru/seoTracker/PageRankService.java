package ru.seoTracker;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

/**
 * Created by alex on 29.05.2014.
 */
public class PageRankService {
    static private int dataCenterIdx = 0;

    /**
     * List of available google datacenter IPs and addresses
     */
    static final public String[] GOOGLE_PR_DATACENTER_IPS = new String[]{
//                "www.google.com",
//                "64.233.161.101",
//                "64.233.177.17",
//                "64.233.183.91",
//                "64.233.185.19",
//                "64.233.189.44",
//                "66.102.1.103",
//                "66.102.9.115",
//                "66.249.81.101",
//                "66.249.89.83",
//                "66.249.91.99",
//                "66.249.93.190",
//                "72.14.203.107",
//                "72.14.205.113",
//                "72.14.255.107",
            "toolbarqueries.google.com",
    };

    /**
     * Default constructor
     */
    public PageRankService() {

    }

    /**
     * Must receive a domain in form of: "http://www.domain.com"
     *
     * @param domain - (String)
     * @return PR rating (int) or -1 if unavailable or internal error happened.
     */
    public int getPR(String domain) {

        int result = -1;
        JenkinsHash jHash = new JenkinsHash();

        String googlePrResult = "";

        long hash = jHash.hash(("info:" + domain).getBytes());

        String url = "http://" + GOOGLE_PR_DATACENTER_IPS[dataCenterIdx] + "/tbr?client=navclient-auto&hl=en&" +
                "ch=6" + hash + "&ie=UTF-8&oe=UTF-8&features=Rank&q=info:" + domain;

        try {
            URLConnection con = new URL(url).openConnection();
            InputStream is = con.getInputStream();
            byte[] buff = new byte[1024];
            int read = is.read(buff);
            while (read > 0) {
                googlePrResult = new String(buff, 0, read);
                read = is.read(buff);
            }
            googlePrResult = googlePrResult.split(":")[2].trim();
            result = new Long(googlePrResult).intValue();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        dataCenterIdx++;
        if (dataCenterIdx == GOOGLE_PR_DATACENTER_IPS.length) {
            dataCenterIdx = 0;
        }

        return result;
    }
}
