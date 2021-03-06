TREES = ['Acacia','Ash', 'Aspen', 'Beech', 'Birch', 'Cedar', 'Cherry', 'Cottonwood', 'Elm', 'Eucalyptus', 'Fir', 'Hawthorn', 'Hazel', 'Hemlock', 'Hickory', 'Holly', 'Juniper', 'Larch', 'Laurel', 'Magnolia', 'Maple', 'Oak', 'Palm', 'Pine', 'Redbud', 'Redwood', 'Rowan', 'Sassafras', 'Sequoia', 'Spruce', 'Sycamore', 'Willow']

FLOWERS = ['Acacia', 'Ageratum', 'Alpina', 'Aster', 'Belladonna', 'Bellflower', 'Boronia', 'Boxwood', 'Carnation', 'Carnation', 'Caspia', 'Celosia', 'Chrysanthemum', 'Clarkia', 'Cornflower', 'Cosmo', 'Craspedia', 'Daffodil', 'Dahlia', 'Daisy', 'Eucalyptus', 'Fern', 'Flax', 'Freesia', 'Gardenia', 'Gerbera', 'Ginger', 'Gladiolus', 'Heath', 'Heather', 'Helicona', 'Hydrangea', 'Iris', 'Jonquil', 'Larkspur', 'Lavender', 'Lilac', 'Lily', 'Limonium', 'Mum', 'Musa', 'Myrsine', 'Myrtle', 'Myrtus', 'Nerine', 'Nigella', 'Orchid', 'Paeonia', 'Peony', 'Pepperberry', 'Philodendron', 'Phlox', 'Plantain', 'Poinsettia', 'Poppy', 'Porium', 'Rose', 'Safflower', 'Sage', 'Salix', 'Snapdragon', 'Strawflower', 'Sunflower', 'Thistle', 'Tulip', 'Veronica', 'Wattle', 'Windflower', 'Yarrow', 'Zinna']

FIRST = TREES
LAST = FLOWERS

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
                name = FIRST.sample + ' ' + LAST.sample
                username = name.gsub(' ', '').downcase
                if (User.find_by username:username).nil?
                    user = User.create! name: name, email: email, username: username, require_valid_signup: false, require_recaptcha: false, email_verified: true
                    added << user
                end
            end
        end
        MembershipService.add_users_to_group(users:added, group:Group.find(ENV['GID']), inviter:User.find(1))
#        LoginTokenService.create(actor: user, uri: URI::parse('http://deliberation.science/'))

    end

    task :debug_new_user => :environment do
        
        name = COLORS.sample + ' ' + FLOWERS.sample
        username = name.gsub(' ', '').downcase
        email = username + '@elplatt.com'
        user = User.create! name: name, email: email, username: username, require_valid_signup: false, require_recaptcha: false, email_verified: true
        #LoginTokenService.create(actor: user, uri: URI::parse('http://deliberation.science/'))

    end
    
    task :export_results => :environment do
        
        discussion = Discussion.find(ENV['DISCUSSION'])
        options = discussion.polls.order(:created_at).first.poll_options.order(:id)
        cols = options.pluck(:name)
        puts (['stage', 'participant_id'] + cols).join("\t")
        
        discussion.polls.order(:created_at).each_with_index do |poll, i|
            for stance in poll.stances do
                row = {}
                for choice in stance.stance_choices do
                    row[choice.poll_option.name] = choice.score
                end
                vals = [i, stance.participant_id] + cols.map { |c| row[c] }
                puts vals.join("\t")
            end
        end
    end
end
