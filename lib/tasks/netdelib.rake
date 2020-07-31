COLORS = ['Aqua', 'Beige', 'Black', 'Blue', 'Bronze', 'Brown', 'Cadet', 'Cadmium', 'Canary', 'Carmine', 'Carnation', 'Celadon', 'Celestial', 'Cerise', 'Cerulean', 'Charcoal', 'Chartreuse', 'Chestnut', 'Cinnabar', 'Cobalt', 'Copper', 'Cornflower', 'Forest', 'Fuchsia', 'Gold', 'Goldenrod', 'Gray', 'Green', 'Indigo', 'Lavender', 'Lemon', 'Madder', 'Magenta', 'Mahogany', 'Maize', 'Maroon', 'Melon', 'Midnight', 'Navy', 'Olive', 'Orange', 'Periwinkle', 'Pewter', 'Plum', 'Red', 'Saffron', 'Salmon', 'Scarlet', 'Seafoam', 'Sepia', 'Sienna', 'Silver', 'Slate', 'Sunset', 'Tan', 'Tangerine', 'Taupe', 'Teal', 'Turquoise', 'Ultramarine', 'Umber', 'Vermillion', 'Violet', 'Viridian', 'White', 'Yellow']

FLOWERS = ['Acacia', 'Ageratum', 'Alpina', 'Aster', 'Belladonna', 'Bellflower', 'Boronia', 'Boxwood', 'Carnation', 'Carnation', 'Caspia', 'Celosia', 'Chrysanthemum', 'Clarkia', 'Cornflower', 'Cosmo', 'Craspedia', 'Daffodil', 'Dahlia', 'Daisy', 'Eucalyptus', 'Fern', 'Flax', 'Freesia', 'Gardenia', 'Gerbera', 'Ginger', 'Gladiolus', 'Heath', 'Heather', 'Helicona', 'Hydrangea', 'Iris', 'Jonquil', 'Larkspur', 'Lavender', 'Lilac', 'Lily', 'Limonium', 'Mum', 'Musa', 'Myrsine', 'Myrtle', 'Myrtus', 'Nerine', 'Nigella', 'Orchid', 'Paeonia', 'Peony', 'Pepperberry', 'Philodendron', 'Phlox', 'Plantain', 'Poinsettia', 'Poppy', 'Porium', 'Rose', 'Safflower', 'Sage', 'Salix', 'Snapdragon', 'Strawflower', 'Sunflower', 'Thistle', 'Tulip', 'Veronica', 'Wattle', 'Windflower', 'Yarrow', 'Zinna']

namespace :netdelib do
    desc "Create new users from list of emails."
    task :create_users => :environment do
        
        added = []
        text = File.open(ENV['EMAILS']).read
        text.each_line do |line|
            email = line.strip!
            if email.nil? or email.empty?
                next
            end
            while (User.find_by email:email).nil? do
                name = COLORS.sample + ' ' + FLOWERS.sample
                username = name.gsub(' ', '').downcase
                if (User.find_by username:username).nil?
                    user = User.create! name: name, email: email, username: username
                    added << user
                    LoginTokenService.create(actor: user, uri: URI::parse('http://deliberation.science/'))
                end
            end
        end
        MembershipService.add_users_to_group(users:added, group:Group.find(ENV['GID']), inviter:User.find(1))

    end
end