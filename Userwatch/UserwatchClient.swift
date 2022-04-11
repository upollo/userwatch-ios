import Foundation
import UserwatchCore

public class UserwatchClient {
  private var core: UWCore

  public init(publicApiKey: String, options: [String: String] = [:]) throws {
    self.core = try UWCore(publicApiKey: publicApiKey, options: options)
  }

  public func identify(
    uid: String?,
    email: String?,
    phone: String?,
    username: String?,
    did eventtype: Uwproto_EventType,
    callback: @escaping (Uwproto_AnalysisResponse) -> Void,
    failure: @escaping (Error) -> Void) {

      self.core.identify(
        forUid: uid,
        email: email,
        phone: phone,
        username: username,
        did: Int32(eventtype.rawValue),
        callback: { resp in
          var ar: Uwproto_AnalysisResponse
          do {
            ar = try Uwproto_AnalysisResponse.init(serializedData: resp)
          } catch {
            failure(error)
            return
          }
          callback(ar)
        },
        failure: failure)
    }
}
