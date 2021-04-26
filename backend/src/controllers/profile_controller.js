const connection = require('../database/connection');

module.exports = {
    async list(request, response) {
        const ong_ig = request.headers.authorization;
        const cases = await connection('cases').where('ong_id', ong_ig).select('*');

        return response.json(cases);
    }
}