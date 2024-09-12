import UIKit

/// While investigating a latency issue on the Goodnotes app, you found out that some of our servers are saturated with multiple requests from the same users. To solve the issue, you decide to implement an algorithm to reject requests from users that send too many of them.

///For simplicity, you can assume that a request to the server is represented as a string containing the **request_id**, **ip_address**, and the **unix_timestamp_in_milliseconds** separated by whitespaces. We want to assign an integer limit of **limit_per_second** requests accepted per second per IP address. In other words, the server should accept at most **limit_per_second** requests per second from each IP address. Any extraneous requests should be rejected.

///Your task is to write a function **GetRejectedRequests** to compute and return the list of requests that should be rejected by our servers. Your function will be called with a list of **requests** (represented as a list of strings, sorted by timestamp) and the limit **limit_per_second** (represented as an integer). The returned list should be a list of request ids (integers) in chronological order i.e. the timestamp for the corresponding requests should be in nondecreasing order. If two requests in the returned list have the same timestamp, please keep them in the same relative order as they appear in the input. If no requests are rejected, please return an empty list.

///**Example 1**
/*
requests: ["1 172.253.115.138 50000", "2 172.253.115.139 50100", "3 172.253.115.138 50210", "4 172.253.115.139 50300", "5 172.253.115.138 51000", "6 172.253.115.139 60300"]

limit_per_second: 1
*/


///The third request and the first request are from the same IP and only 210 ms apart. Therefore, the third request should be rejected. The fifth request, also with the same IP, is not rejected since 1000 ms (i.e., 1 second) has elapsed since the last accepted (i.e., first) request, so we can accept this request.

///The fourth request and the second request are also from the same IP and only 200 ms apart. The second request must be accepted as it is the first from this IP address. Therefore, we must reject the fourth request.

///The expected answer is therefore the request ids of the third and fourth requests i.e. **[3, 4]**

///**Example 2**
/*
 requests: ["10 172.253.115.138 50000", "20 172.253.115.138 50000", "30 172.253.115.138 50000"]

 limit_per_second: 2

 */

///In this case, all requests have the same IP address and timestamp. We will process the list in order and accept the first and second request. However, the third request should be rejected since we have reached our limit of 2.

/// The expected answer is therefore the request ID of the third request i.e. [30]

///**Example 3**
/*

 requests: ["1 172.253.115.138 50000", "2 172.253.115.138 50900", "3 172.253.115.138 51000", "4 172.253.115.138 51500"]

 limit_per_second: 2

 */

/// We accept the first and second requests. The third request is also accepted as 1000 ms has elapsed since the first request.

/// The fourth request, however, must be rejected as we have accepted two requests from this IP with timestamps within a second of this request, namely request 2 and 3.

/// The expected answer is therefore the request ID of the fourth request i.e. [4]

//Here is the extracted text from the third image you provided:
//
//**Important Assumptions**
//
//- You can assume that requests will be sorted by timestamp in nondecreasing order.
//- The number of requests in any one test case will not exceed 200000.
//- No two request ids will be the same.
//- Different request ids may have the same IP address and timestamp. In such cases, we process the input list in the provided order to decide which request id to accept/reject. The second example above illustrates this case.
//- You can assume that the timestamp for each request fits in a 64-bit integer.
//- You can assume that **limit_per_second** and **request_id** for all requests fit in a 32-bit integer.
//- You can assume that the **IP address** will be a string containing only numbers and dots.
//
//**Testing using Custom Input**
//
//Due to **HackerRank**, the input format in the test cases below looks a little different. The first line contains the number of requests, say N. The next N lines contain strings describing the requests in the format explained above. The last line of input contains **limit_per_second**. Please use this format if you wish to run your code against custom test cases.
//
//---
//
//**Helpful Tips**
//
//The test data covers all edge cases that are within the problem constraints defined above. Please do not attempt to write a brute-force solution that would have quadratic complexity in the worst case, as it will almost certainly time-out.


func getRejectedRequests(array: [String], limitPerSecond: Int32) -> [Int32] {
    var rejectedIds = [Int32]()
    let timeOffset = 1000
    var countAdded: Int32 = limitPerSecond
    var passedIds = [String: (String, Int32)]()

    for item in array {
        let request = item.components(separatedBy: " ")
        let newId = request[0]
        let newIp = request[1]
        let newTimeStamp = request[2]

        print("id \(newId) ip \(newIp) timeStamp \(newTimeStamp)")

        let checkedIpAndTime = passedIds[newIp]

        if let checkedIpAndTime {
//            print("checkedIpAndTime \(checkedIpAndTime) newId \(newId)")

            if let timeValue1 = Int32(newTimeStamp), (timeValue1 - Int32(checkedIpAndTime.1)) < timeOffset {
                countAdded -= 1
                rejectedIds.append(Int32(newId) ?? 0)
            }

        } else {
            passedIds[newIp] = (newId, Int32(newTimeStamp) ?? 0)
        }
    }
    print("passedIds \(passedIds)")
    return rejectedIds
}

/// Tests
let exampleArray1 = ["1 172.253.115.138 50000", "2 172.253.115.139 50100", "3 172.253.115.138 50210", "4 172.253.115.139 50300", "5 172.253.115.138 51000", "6 172.253.115.139 60300"]
let limit_per_second1: Int32 = 1
let array1 = getRejectedRequests(array: exampleArray1, limitPerSecond: limit_per_second1) // [3, 4]
let res1 = array1 == [3, 4] ? "passed" : "failed"
print("Test 1 reject \(array1)")
print("Test 1 \(res1)")

let exampleArray2 = ["10 172.253.115.138 50000", "20 172.253.115.138 50000", "30 172.253.115.138 50000"]
let limit_per_second2: Int32 = 2
let array2 = getRejectedRequests(array: exampleArray2, limitPerSecond: limit_per_second2) // [30]
let res2 = array2 == [30] ? "passed" : "failed"
print("Test2 rejected \(array2)")
print("Test 2 \(res2)")

//let exampleArray3 = ["1 172.253.115.138 50000", "2 172.253.115.138 50900", "3 172.253.115.138 51000", "4 172.253.115.138 51500"]
//let limit_per_second3: Int32 = 2
//let array3 = getRejectedRequests(array: exampleArray3, limitPerSecond: limit_per_second3) // [4]
//let res3 = array3 == [4] ? "passed" : "failed"
//print("Test3 rejected \(array3)")
//print("Test 3 \(res3)")
