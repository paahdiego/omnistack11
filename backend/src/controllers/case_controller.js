const connection = require('../database/connection');

module.exports = {
    async create(request, response) {
        const { title, description, value } = request.body;
        const ong_id = request.headers.authorization;

        console.log(request.body);

        console.log(ong_id);

        const [id] = await connection('cases').insert({
            title, description, value, ong_id,
        });

        return response.json({
            id
        });
    },
    async list(request, response) {
        const { page = 1 } = request.query;

        const [count] = await connection('cases').count();

        console.log(count);

        const cases = await connection('cases')
            .join('ongs', 'ongs.id', '=', 'cases.ong_id')
            .limit(5)
            .offset((page - 1) * 5)
            .select([
                'cases.*',
                'ongs.name',
                'ongs.whatsapp',
                'ongs.city',
                'ongs.uf',
            ]);

        response.header('X-Total-Count', count['count(*)']);

        return response.json(cases);
    },

    async delete(request, response) {
        const { id } = request.params;
        const ong_id = request.headers.authorization;

        const caso = await connection('cases').where('id', id).select('ong_id').first();

        if (caso.ong_id !== ong_id) {
            return response.status(401).json({ error: 'Operation not permitted.' });
        }

        await connection('cases').where('id', id).delete();

        return response.status(204).send();
    }
}