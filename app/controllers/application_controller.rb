class ApplicationController < ActionController::API
    # skip_before_action :verify_authencity_token
    # acts_as_token_authentication_handler_for User
    # Autentificação comentada em todos os controllers para teste
    
    def secret_key
        "4227435"
    end

    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    def decode(token)
        JWT.decode(token, "4227435", true, {algorithm: 'HS256'})[0]
    end

    private
    
    def require_authentication!
        throw(:warden, scope: :user) unless current_user.presence
    end
end
